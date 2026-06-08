# Library ABI Profiles and IPA Coordination Design

This note describes how a deflate implementation can become a reusable library
while still allowing asmp to use internal calling-convention cloning, IPA
register allocation, and implementation versioning.

## Core Rule

Use a stable public ABI profile at the library boundary and private managed
ABIs inside the library.

In other words:

- exported symbols are ABI barriers with an explicit profile;
- header exposure is separate from symbol export, so raw implementation entries
  can remain linkable for benchmarks or internal dispatch without becoming API;
- internal functions may be cloned, renamed, inlined, or given custom calling
  conventions;
- compiler-created clones are private implementation details;
- the public symbol remains stable and address-taken safe.

This is the same broad scheme used by optimizing compilers and runtimes:
public ABI thunks/wrappers at the boundary, private fast calling conventions
inside the optimized module.

## Public ABI Profiles

The public boundary does not have to be C ABI. C ABI is simply the first and
most portable profile asmp should support. A library may expose several public
profiles:

| Profile | Purpose | Example |
|---------|---------|---------|
| `c-aapcs64` | Portable C/C++ callers on AArch64 | shared/static library API |
| `apple-c-arm64` | Mach-O C ABI details and symbol spelling | macOS/iOS library |
| `linux-syscall` | `_start` or syscall-style leaf entry | freestanding tools |
| `kernel-aarch64` | kernel/module ABI constraints | OS or firmware code |
| `jit-private` | runtime-generated code calling into asmp | language runtime |
| `project-abi` | application-specific plugin or engine ABI | game/DB/codec engine |

An exported function should therefore record:

```text
export-profile = c-aapcs64 | apple-c-arm64 | linux-syscall | ...
linkage-name   = public concrete symbol
visibility     = public | hidden | local
contract       = argument/result locations, preserved registers, stack rules
```

Internally, this profile should lower to an ABI config/effect summary, but it
also carries source-level obligations that plain register sets do not capture:
symbol visibility, address-taken safety, unwind/debug expectations, red-zone or
stack-alignment rules, and platform object-format details.

## Default Public C API

The default C profile should avoid exposing complex platform ABI details. Use
pointers, integer sizes, status codes, and caller-provided scratch memory.

```c
enum asmp_deflate_status {
  ASMP_DEFLATE_OK = 0,
  ASMP_DEFLATE_DST_TOO_SMALL = 1,
  ASMP_DEFLATE_SCRATCH_TOO_SMALL = 2,
  ASMP_DEFLATE_BAD_ARGUMENT = 3
};

uint64_t asmp_deflate_raw_bound(uint64_t src_len);

uint64_t asmp_deflate_raw_scratch_size(void);

uint64_t asmp_deflate_raw_scratch_align(void);

int asmp_deflate_raw_fixed(uint8_t *dst,
                           uint64_t dst_cap,
                           uint64_t *dst_len,
                           const uint8_t *src,
                           uint64_t src_len,
                           void *scratch,
                           uint64_t scratch_len);

int asmp_deflate_raw_stored(uint8_t *dst,
                            uint64_t dst_cap,
                            uint64_t *dst_len,
                            const uint8_t *src,
                            uint64_t src_len);

int asmp_deflate_raw_auto(uint8_t *dst,
                          uint64_t dst_cap,
                          uint64_t *dst_len,
                          const uint8_t *src,
                          uint64_t src_len,
                          void *scratch,
                          uint64_t scratch_len);
```

The API intentionally does not return the compressed size directly from the
compressor. A status return leaves room for capacity checks and future policy
fallbacks. The actual output length is written through `dst_len`.

`asmp_deflate_raw_stored` is an explicit uncompressed raw-deflate path. It does
not need scratch memory and remains useful for tests, fallback experiments, and
callers that know they want stored output.

`asmp_deflate_raw_auto` is the current default-like raw deflate entry. The MVP
still runs the fixed-Huffman encoder first, computes exact stored length, and
rewrites the stream as stored if stored is no larger. That keeps the public ABI
simple while leaving room for a later block-level selector or dynamic-Huffman
implementation behind the same wrapper.

The initial scratch layout can be:

```text
head[32768] : uint32_t
prev[32768] : uint32_t
```

That is 262144 bytes total. The scratch API lets future versions add tables or
alignments without changing the compressor signature.

## Public Wrapper Shape

The exported function should be a small profile wrapper. For the C profile, it
translates AAPCS64 C argument registers into managed internal parameters, calls
a private implementation, then translates the result back to C ABI.

Sketch:

```asm
.function asmp_deflate_raw_fixed export profile=c-aapcs64 (
  in: x.dst, x.dst_cap, x.dst_len, x.src, x.src_len, x.scratch, x.scratch_len,
  out: w.status
)
entry:
  .save all

  .call asmp.deflate.raw.fixed.impl abi=deflate_internal (
    x.dst=x.dst,
    x.dst_cap=x.dst_cap,
    x.dst_len_ptr=x.dst_len,
    x.src=x.src,
    x.src_len=x.src_len,
    x.scratch=x.scratch,
    x.scratch_len=x.scratch_len,
    w.status=w.status
  )

  .restore all
  ret
.end
```

If the private target is still a raw physical-ABI routine, compute temporaries
first and write `x0..xN` immediately before `bl`; raw `bl` argument registers
are not source-level managed values.

The private implementation can then use a managed signature:

```asm
.function asmp.deflate.raw.fixed.impl (
  in:  x.dst, x.dst_cap, x.dst_len_ptr, x.src, x.src_len,
       x.scratch, x.scratch_len,
  out: w.status
)
  ...
.end
```

For C library distribution, the wrapper is the only header-visible symbol.
Internal implementations can be private functions, hidden `no-header` exports
for benchmark/linker entry points, or versioned clones:

```text
asmp.deflate.raw.fixed.impl
asmp.deflate.raw.fixed.impl$asmp.cc.deflate_internal
asmp.deflate.raw.fixed.impl$asmp.reinsert
asmp.deflate.raw.fixed.impl$asmp.lazy
```

Only the wrapper should appear in the installed C header. Other public profiles
may use a different manifest format, but the same rule applies: public profile
symbols are stable, private implementation symbols are not.

## IPA Rules

The compiler should treat exported functions as public ABI roots.

1. Do not delete exported functions.
2. Do not rename their public linkage symbol.
3. Do not rewrite external references to a clone.
4. Do allow the body of an exported wrapper to call private optimized clones.
5. Do treat header-visible public roots as automatic IPA call-convention
   barriers; a source-level `.call abi=...` hint may still request a specific
   clone when the user wants that explicit edge behavior.
6. Do allow hidden `no-header` exported raw/internal roots to be optimized like
   private implementations, while keeping their canonical linkage symbol stable.
7. Do keep clone metadata tied to the logical function identity for debug and
   profiling.

This preserves the public profile contract while still giving IPA freedom
inside the closed module graph.

## Regalloc Rules

There are two ABI views:

- public ABI profile: what external callers observe;
- internal invoke ABI: what a particular managed call edge uses.

For exported wrappers under the C profile:

- compile under AAPCS64;
- use `.save all` when the wrapper or regalloc needs callee-saved registers;
- avoid exposing SVE/FPR aggregate ABI details at the C layer for now;
- keep the wrapper simple enough that spills are rare.

For private implementations:

- let IPA choose or clone internal calling conventions;
- allow `.call abi=...` hints for hand-guided experiments;
- feed callee clobber/effect summaries into the caller's regalloc;
- keep FPR/SVE/predicate clobber summaries separate from GPR summaries.

The important invariant is:

```text
external caller -> public ABI profile wrapper -> private managed ABI world
```

Never require external code to know about private clone symbols or private
ABI slot choices.

## IPA/Regalloc Requirements

High performance depends on the internal IPA/regalloc layer being more capable
than the public ABI layer. The public ABI is deliberately conservative; private
code must recover performance.

Required internal capabilities:

1. Function identity and clone families
   - Preserve logical identity across all clones.
   - Keep clone reason, specialization key, source/debug origin, and public
     wrapper relationship.
   - Let diagnostics/profile views group clone versions back to one logical
     function.

2. Public boundary modeling
   - Mark exported profile roots as ABI barriers.
   - Track address-taken functions and externally visible symbols.
   - Prevent private clone symbols from leaking into public symbol tables.

3. Interprocedural register allocation
   - Propagate callee clobber/effect summaries across the call graph.
   - Distinguish GPR, FPR/NEON, SVE `z`, and predicate `p` effects.
   - Allow callsite-specific ABI choices for managed `.call`.
   - Recompute caller allocation with selected callee effects.

4. Calling-convention selection
   - Start with explicit `.call abi=...` source hints.
   - Add automatic candidate selection by move cost, spill cost, and register
     pressure.
   - Make selection clone-aware and callsite-aware.
   - Add budgets to avoid clone explosion.

5. Closed-world module planning
   - Treat all input modules as one optimization unit before lowering managed
     calls.
   - Resolve definitions across files without requiring separate extern
     signatures for managed functions.
   - Keep public ABI wrappers as roots, then optimize inward.

6. Spill and frame quality
   - Avoid forcing public ABI preserved-register rules onto private code.
   - Let private leaf or custom ABI variants expose more scratch registers.
   - Track whether using more scratch registers is cheaper than spill/fill.
   - Improve FPR/SVE spill support before vector-heavy deflate work.

7. Debug and profile coherence
   - Attribute clone instructions to the logical function by default.
   - Keep optional clone-specific names for low-level performance work.
   - Support breakpoints at public wrappers and private implementation entry
     points.

The design target is not "always use C ABI". It is:

```text
public ABI profiles are stable contracts;
private IPA ABI profiles are optimization choices.
```

## Dispatch and Version Selection

A future library may want multiple implementations:

- fixed one-candidate parser;
- hash-chain parser;
- skipped-byte reinsertion parser;
- lazy parser;
- SVE/NEON match extension.

Some versions are compiler-created clones, such as call-convention or
caller-specialized copies. Others are user-written source variants, such as a
hand-written NEON match extender. They should share the same logical function
identity, but keep distinct private linkage symbols and version metadata.

Example source variant:

```asm
.function asmp.deflate.fixed.neon-extend variant-of=asmp.deflate.fixed version=neon-extend feature=neon (...)
  ...
.end
```

The optimizer can choose or rewrite calls to this version only after the
hand-written body exists. It is a selection problem, not a promise that asmp
will synthesize NEON from scalar code.

For hand-guided builds, a managed call can choose a source variant by logical
target:

```asm
.call asmp.deflate.fixed variant=neon-extend (...)
.call asmp.deflate.fixed feature=neon (...)
```

The call still uses named bindings. The hint only selects an existing concrete
variant whose `variant-of`, `version`, and `feature` metadata match.

Use a stable public-profile dispatcher:

```text
asmp_deflate_raw_fixed
  -> private selected implementation
```

On ELF, IFUNC-style dispatch could be supported later. For portable behavior
across Mach-O and ELF, a normal wrapper dispatcher is simpler:

- choose at build time for the MVP;
- later choose at first call based on CPU features and cache a function
  pointer;
- keep all private symbols hidden/non-exported;
- use `no-header` for exported raw/internal entries that are useful to link but
  must not leak into installed C headers.

Dispatch itself is also a public profile wrapper. Its internal target may be a
function pointer, a private direct call, or a platform-specific resolver, but
callers should not observe that choice.

## Current Gaps In asmp

The current codebase already has many required pieces:

- `export` keeps public symbols emitted;
- `export profile=<name>` records a public ABI profile in CFG metadata;
- `visibility=hidden` emits platform symbol-hidden directives, and `no-header`
  omits an exported public root from generated C headers without removing it
  from the ABI manifest;
- function identity metadata records logical names and clone versions;
- CFG clone support creates private versioned symbols and clears public boundary metadata on clones;
- IPA callconv can clone callees, rewrite managed callsites, and preserve the
  public profile origin when cloning an exported root; the automatic planner
  skips header-visible public roots and still considers hidden `no-header`
  roots as internal optimization candidates;
- CFG checks enforce minimal profile-specific entry rules: ordinary public
  profiles reject private managed ABIs on the canonical entry, while
  `jit-private` / `project-abi` require an explicit `abi=<name>`;
- `--public-abi-manifest <file>` writes a readable public export manifest for
  build tooling, header generation, dispatch, and debug/profile attribution;
- `--public-c-header <file>` emits conservative C prototypes for C-like public
  roots with simple managed signatures;
- C-like public roots lower managed signatures with independent argument and
  return slots, so `in` / `inout` values enter through ABI `args` registers and
  single-result `out` / `inout` values return through ABI `return` registers;
- `example/019-deflate-fixed-chain.asm` exports a C-profile deflate wrapper
  (`asmp_deflate_raw_fixed`) with `dst_cap`, `dst_len`, scratch, and status
  handling; the native zlib harness includes the generated header and calls
  this wrapper;
- `.call abi=...` can guide one callsite;
- regalloc has ABI effects and save/restore support.

The gaps to close for a polished library mode are:

1. Extend public profile checkers beyond the current minimal entry-rule MVP.
2. Add profile-specific lowering where the external convention is not C-like
   function entry.
3. Extend generated headers beyond the current simple managed-signature C MVP,
   and add non-C interface descriptions from the public ABI manifest.
4. Track address-taken functions so IPA does not bypass wrappers incorrectly.
5. Extend summaries for SVE/predicate clobbers before exposing advanced vector
   internals.
6. Add internal ABI selection that considers spill cost and register pressure,
   not only managed-call move cost.
7. Extend managed public signatures beyond simple scalar C-like arguments and
   single scalar returns.

## MVP Plan

1. Keep `019` as the raw internal baseline.
2. Keep `asmp_deflate_raw_fixed` in `019` as the managed-signature public C
   wrapper.
3. Add `020` for parser quality work or the next deflate optimization.
4. Keep the native harness calling only the public wrapper.
5. Keep implementation versions registered in `VERSIONS.md`.
6. Turn the generated `asmp_deflate.h` into an installable artifact once the
   wrapper status API is stable.
