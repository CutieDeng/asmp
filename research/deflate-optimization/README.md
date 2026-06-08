# Deflate Optimization Subproject

This subproject tracks deflate algorithm experiments for asmp-generated
AArch64 assembly. It is intentionally separate from `example/` so each
implementation version can remain available for reading, regression testing,
and performance comparison.

## Scope

The current line of work targets raw deflate streams:

- fixed-Huffman compressed blocks;
- explicit stored-block output for uncompressed fallback experiments;
- a simple public fixed-vs-stored selector;
- no zlib/gzip wrapper;
- no checksum;
- no dynamic Huffman tree;
- no parser-driven compressed block splitting or dynamic selector.

That is deliberate. The goal is to make the match parser, bit writer, register
allocation pressure, and assembler frontend behavior easy to inspect before
adding table-heavy or multi-block compression.

For the planned public C library interface and its interaction with IPA
calling-convention/regalloc work, see `API-DESIGN.md` and
`IPA-REGALLOC-ROADMAP.md`. For the dynamic-Huffman implementation route, see
`DYNAMIC-HUFFMAN.md`. For the scalar-to-SIMD LZ77 plan, see
`VECTORIZED-LZ77-ROADMAP.md`.

## Current Capability

The current implementation is usable as a native AArch64 raw-deflate MVP, not
as a complete deflate/zlib/gzip library.

| Area | Current status |
|------|----------------|
| Stream format | Raw deflate only. Fixed-Huffman output is one final compressed block; stored output uses standard stored blocks split at 65535 bytes when needed. |
| Public API | `asmp_deflate_raw_fixed`, `asmp_deflate_raw_stored`, `asmp_deflate_raw_auto`, `asmp_deflate_raw_bound`, scratch size/alignment helpers. |
| LZ77 parser | 32 KiB window, 15-bit hash, `head[32768] + prev[32768]`, bounded 32-node chain search, skipped-byte reinsertion, one-byte lazy lookahead. |
| Match coding | Deflate length range 3..258 and distance range 1..32768. |
| Compression level | One fixed low-level strategy, roughly a level-1 style parser, plus explicit stored and auto fixed-vs-stored paths. There is no selectable level API yet. |
| Huffman | Fixed Huffman encoder only. There is no literal/distance frequency table, Huffman tree builder, canonical dynamic-code generator, or dynamic block header emitter yet. |
| Block policy | `asmp_deflate_raw_auto` emits fixed output first, compares it with exact stored length, and rewrites as stored if stored is no larger. There is no block-level selector, no dynamic-Huffman fallback, and no parser-driven compressed block splitting. |
| Wrapper formats | No zlib wrapper, gzip wrapper, Adler-32, or CRC-32. |
| Validation | Native macOS arm64 roundtrip through zlib raw inflate, status/error checks, compressed-size quality baseline, and benchmark CSV comparison against zlib fixed-Huffman level 1. |

In short: LZ77 is real but intentionally simple; deflate emission is complete
for the fixed-Huffman single-block subset, raw stored blocks, and whole-stream
fixed-vs-stored selection; dynamic Huffman tree build is not implemented.
A small Racket reference encoder and `020-deflate-dynamic-litonly.asm` now emit
a literal-only dynamic block and verify the dynamic header/canonical-code
mechanics through zlib. The Racket reference also has a frequency-driven
literal-only path with code-length RLE; the next assembly step is to mirror
that path in a new preserved source. `021-deflate-dynamic-litfreq.asm` has
started that port by validating the native literal/length frequency histogram.
`022-deflate-dynamic-litlen-balanced.asm` now adds a native balanced
literal/length length-table scaffold, still short of frequency-optimal Huffman
tree construction.

## Version Rule

Do not overwrite an existing deflate implementation when trying a new idea.
Add a new source file under `example/` with a new number and symbol:

```text
example/020-deflate-<idea>.asm
deflate_<idea>_aarch64_asm
```

Then update:

- `research/deflate-optimization/VERSIONS.md`
- `research/deflate-optimization/bench-native.rkt`
- `test/deflate-native-test.rkt` if the version should become a correctness
  regression target
- `example/README.md` if the version is useful for users to read

## Current Finding

`019-deflate-fixed-chain.asm` is now the first native integration baseline. It
roundtrips on macOS arm64 through the public `asmp_deflate_raw_fixed`,
`asmp_deflate_raw_stored`, and `asmp_deflate_raw_auto` wrappers, generated
`asmp_deflate.h`, clang, and zlib raw-deflate decoding.

`023-deflate-fixed-chain-word-extend.asm` keeps the same parser policy and
compressed sizes as 019, but accelerates LZ77 match extension with 8-byte
chunk compares and `rbit`/`clz` mismatch location. It is included in the native
compare runner as `asmp-023-wordextend-public`.

`024-deflate-fixed-chain-neon-extend.asm` keeps the 023 compressed output, but
uses hand-written NEON to skip equal 16-byte chunks before falling back to the
scalar 8-byte mismatch locator. It is included in the native compare runner as
`asmp-024-neonextend-public`.

The parser is still intentionally simple, but no longer literal-heavy on
repetitive input:

- bounded hash chains;
- skipped match bytes are reinserted into the chains;
- one-byte lazy-match lookahead;
- fixed Huffman only for the parsed compressed path; the auto wrapper can
  choose whole-stream stored output, but not per-block stored/dynamic output;
- byte-by-byte match extension in 019, with 023 providing a word-at-a-time
  extension baseline and 024 providing a first NEON extension variant.

Complex integration and performance E2E work can start now as a manual or
nightly activity. Keep machine-dependent timing out of the default correctness
gate until the benchmark corpus, baseline recording, and allowed variance are
more stable.

Run the current native baseline with:

```bash
racket research/deflate-optimization/bench-native.rkt --iterations 20
```

The runner emits CSV for the public asmp fixed, word-extend, NEON-extend,
stored, and auto wrappers plus zlib fixed-Huffman level 1. It intentionally includes only
versions that are safe to call from a C harness and pass raw-deflate roundtrip;
older preserved versions remain in `VERSIONS.md` even when they are not
executed by the runner.

For a lightweight integration quality gate, run:

```bash
racket research/deflate-optimization/check-native-quality.rkt --iterations 3
```

That command invokes the native benchmark, requires every reported codec/case to
roundtrip successfully, and checks the public asmp wrapper against
`quality-baseline.csv`. The baseline guards compressed size only; throughput is
reported by `bench-native.rkt` but remains advisory until variance tracking is
available.

To keep local performance history, run:

```bash
racket research/deflate-optimization/record-native-bench.rkt --iterations 20 --runs 5 --label 019-baseline
```

The recorder writes an ignored CSV under `research/deflate-optimization/runs/`.
Each row includes run number, timestamp, host OS/arch, git head, dirty state,
iteration count, and the original benchmark columns. Use this before and after
parser or IPA/regalloc changes when the question is performance trend rather
than pass/fail correctness.

## Experiment Backlog

1. Parser policy
   - Extend the one-byte lazy lookahead into a small level-1/level-3 policy.
   - Measure whether reinserting every skipped position is worth the extra
     store/load traffic.
   - Preserve `019` and add a new numbered file for the next policy.

2. Match extension
   - Keep 023 as the scalar word-at-a-time extension baseline.
   - Measure chain-depth, lazy-policy, and block-policy changes against that
     baseline before introducing a SIMD version.
   - Keep 024 as the first NEON extension baseline; hash-chain traversal stays
     scalar until measurements justify a deeper redesign.

3. Register pressure
   - Compare `.inline` helpers against `.call` helpers with ABI hints.
   - Split the parser into smaller managed helper functions only if it reduces
     spill cost without hiding the algorithm.
   - Avoid physical register pinning until there is a clear measured reason.

4. Block policy
   - Replace the whole-stream auto selector with block-level fixed-vs-stored
     selection.
   - Use the `020` dynamic-Huffman literal-only baseline while adding the real
     frequency-based tree builder.

5. Vectorization
   - Compare 024 against 023 over larger corpora and longer timing runs.
   - Preserve the first SVE match-extension experiment as
     `025-deflate-fixed-chain-sve-extend.asm`.
   - Keep public C-profile entrypoints stable; select scalar, NEON, or SVE
     private variants behind the wrapper.

## Validation Levels

Use these levels when discussing a version:

- Parse: GNU frontend accepts the source.
- Pipeline: CFG, inline lowering, register allocation, and emission succeed.
- Assemble: host toolchain can assemble/link generated output.
- Roundtrip: generated raw deflate inflates back to the input bytes.
- Compare: native benchmark reports size and timing for public asmp entrypoints
  and external references such as zlib fixed-Huffman level 1.

At the moment, native roundtrip and compare are available on macOS arm64 through
clang and zlib.
