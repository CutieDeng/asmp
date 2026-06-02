# AArch64 deflate assembly plan

## Current assembler capability

This repository already has enough machinery to host non-trivial AArch64
kernels:

- S-expression assembly syntax with AArch64 registers, memory modes, labels,
  conditional branches, NEON/SVE register forms, and reloc-style symbols.
- ARM MRS driven instruction validation across mnemonic, operand-shape,
  operand-type, encoding, and immediate-constraint layers.
- A control-flow pipeline, liveness, graph-coloring register allocation,
  spill rewriting, ABI models, and `save!` / `load!` expansion.
- GNU and Apple assembly emission.
- Inline expansion with label and virtual-register hygiene.
- Existing stress examples for SHA1/SHA/NEON, SVE memset, virtual registers,
  ABI handling, and native AVL benchmark generation.

## Implemented deflate target

`example/009-deflate-fixed-fast.d` adds a raw fixed-Huffman deflate fast path.
`example/013-deflate-fixed-fast.asm` is the same bootstrap design written in the
GNU input syntax for discussing frontend syntax and macro/compile-time
semantics:

- one final deflate block, `BFINAL=1`, `BTYPE=01`;
- scalar AArch64 bit writer with LSB-first packing;
- fixed-Huffman literal, length, distance, and EOB emission;
- 15-bit hash table with one previous candidate per bucket;
- fast parser with no lazy matching and no reinsertion of skipped match bytes;
- caller-provided `uint32_t head[32768]` scratch space;
- return value is the number of output bytes written.

This is intentionally a level-1 style core. It is useful as a first assembler
stress case because it exercises unaligned loads, bit-field operations,
register-offset addressing, inlined helpers, many local labels, and a real
stateful bitstream.

The current implementation should stay simple until runtime correctness is
locked down. In particular:

- do not add static Huffman tables while the S-expression frontend lacks compact
  data directives and label-indexed loads;
- do not add lazy matching, chains, or skipped-byte reinsertion before the raw
  one-candidate parser has a decoder-backed test;
- keep bit-writer helpers as inline templates so helper bodies are not emitted
  as duplicate standalone functions;
- write helper state as `.inline-function` virtual formals and call helpers with
  named-only `.inline helper (formal=actual, ...)` bindings, rather than
  smuggling state through fixed physical registers;
- avoid spelling identity shifts such as `lsl 0`; if the assembler requires one
  for some form, that is an assembler gap to fix, not algorithm logic to copy.

## Algorithm roadmap

1. Fixed-Huffman core
   - Keep the current no-table implementation as the bootstrap target: it
     avoids rodata lookup tables and keeps the emitted stream easy to audit.
   - Keep helper snippets as inline templates, so the final object contains the
     exported compressor rather than duplicate standalone helpers.
   - Add correctness tests against a deflate decoder once the full pipeline can
     run in this checkout.

2. Better match finding
   - Move from one-entry hash buckets to hash chains or a small bounded chain.
   - Add lazy match selection for level-1/level-3 quality.
   - Optionally add NEON-assisted compare for extending candidate matches.

3. Dynamic-Huffman blocks
   - Count literal/length and distance frequencies while parsing.
   - Build canonical Huffman codes.
   - Emit code-length trees and dynamic block headers.
   - Keep stored-block and fixed-Huffman fallbacks for incompressible input.

4. Wrappers
   - Keep raw deflate as the kernel ABI.
   - Layer zlib/gzip wrappers, checksums, and block splitting outside or in
     separate assembly/C glue.

## Required assembler extensions

Production-grade deflate will be much easier and faster after these assembler
features land:

- Data directives: `.byte`, `.byte2`, `.byte4`, `.byte8`, `.ascii`, `.section`,
  label-addressable rodata, and alignment for static tables in the
  S-expression frontend. The GNU frontend can already preserve common scalar
  data directives, but the `.d` source used by this kernel still lacks a compact
  table notation.
- Literal pools and constant materialization helpers for 32/64-bit immediates,
  addresses, and platform-specific relocations.
- Parameterized macros or inline templates with explicit inputs, outputs, and
  clobbers. The current `.inline-function` plus named-only `.inline` calls avoid
  duplicate helper emission and make state binding explicit; the next gap is
  using the declared modes and clobbers for stronger compile-time checks.
- Better alias modelling for common bit operations such as `ubfx`, immediate
  `lsl`/`lsr`, logical-immediate `and`, and instruction selection when several
  encodings share the same operand signature.
- Register-allocation constraints for pinned registers, scratch registers,
  and inline-template clobber sets.
- Table-friendly addressing conveniences, including label+index loads and
  safe PIC forms for GNU and Apple emitters.
- Object/link pipeline support or a standard compile-to-object test harness.
- Disassembly and execution tests, ideally with a small C/zlib harness and
  optional QEMU or native AArch64 execution.
- Performance instrumentation hooks for block layout, instruction count,
  dependency chains, and microarchitecture-specific scheduling notes.

## Current validation status

The restored `vendor/cutie-ftree` dependency allows the full Racket pipeline to
run again. The fixed-Huffman deflate source passes parser validation,
instruction validation, CFG construction, inline expansion, register allocation,
emission, and an external Apple arm64 assembler smoke test.

The next validation step is runtime correctness: link the emitted object into a
small C harness, run it on AArch64 hardware or an emulator, and verify the raw
deflate stream with a known-good inflater.
