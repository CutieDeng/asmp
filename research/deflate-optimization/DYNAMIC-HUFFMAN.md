# Dynamic Huffman Implementation Notes

This note records the implementation route for dynamic-Huffman deflate in
asmp. It deliberately starts with a small verified reference encoder before the
tree builder is moved into assembly.

## References

- RFC 1951 is the bitstream authority. Section 3.2.7 defines dynamic blocks:
  `HLIT`, `HDIST`, `HCLEN`, the code-length alphabet order, repeat symbols
  `16..18`, and the combined literal/length plus distance length sequence.
  https://www.rfc-editor.org/rfc/rfc1951
- zlib `trees.c` is the engineering reference for compression-side tree
  construction: build literal/distance trees, scan them to build the bit-length
  tree, then send all trees before the data. The useful functions to mirror are
  `build_tree`, `gen_bitlen`, `gen_codes`, `build_bl_tree`, `scan_tree`,
  `send_tree`, and `send_all_trees`.
  https://www.ncbi.nlm.nih.gov/IEB/ToolBox/CPP_DOC/lxr/source/src/util/compress/zlib/trees.c
- zlib `contrib/puff/puff.c` is the readability reference for decode-side
  dynamic block structure and edge cases. Its comments are especially useful
  for incomplete trees, the single-distance-code case, and code-length repeat
  symbols.
  https://git.acem.ece.illinois.edu/lib/zlib-1.2.13/src/branch/main/contrib/puff/puff.c
- Huffman's original paper is the algorithmic root for optimal prefix codes:
  D. A. Huffman, "A Method for the Construction of Minimum-Redundancy Codes",
  Proceedings of the IRE, 1952.

## Why It Is More Complex Than Fixed Huffman

Fixed Huffman only needs fixed code tables and a bit writer. Dynamic Huffman
adds four extra jobs:

1. Count literal/length and distance symbol frequencies for a block.
2. Build length-limited canonical Huffman code lengths with deflate limits:
   literal/length and distance codes are at most 15 bits; code-length codes are
   at most 7 bits.
3. Encode those lengths using a second Huffman tree over symbols `0..18`,
   including repeat symbols `16`, `17`, and `18`.
4. Choose whether dynamic beats fixed or stored after header cost is counted.

The hard part is therefore not writing a Huffman tree once. It is producing a
valid, compact tree representation that a strict inflate implementation accepts
for every block shape.

## Current Reference Milestone

`dynamic-huffman-reference.rkt` contains two dynamic raw-deflate reference
paths. The first one, mirrored by `example/020-deflate-dynamic-litonly.asm`, is
a literal-only block that is intentionally not frequency-optimal. It uses a
complete literal/length tree:

```text
symbols 0..225   length 8
symbols 226..285 length 9
```

This satisfies the Kraft sum exactly:

```text
226 * 2^-8 + 60 * 2^-9 = 1
```

The single distance code has length zero because the reference block emits only
literals. The code-length alphabet is a simple complete four-bit table for
symbols `0..15`, with `16..18` unused. This is larger than a real encoder's
header, but it proves:

- dynamic block header layout;
- canonical code generation;
- deflate bit reversal for Huffman codes;
- the "no distance codes because there are no matches" case.

The second Racket reference path is frequency-driven for literal-only payloads:
it counts literal frequencies plus EOB, builds length-limited canonical
literal/length codes, compresses the combined code-length sequence with
deflate repeat symbols `16`, `17`, and `18`, and emits a dynamic header that
zlib accepts. This path is the oracle for the next assembly version; it is not
yet mirrored by `020`.

`example/021-deflate-dynamic-litfreq.asm` is the first assembly helper for that
path. It fills `ll_freq[286]` for literal-only dynamic blocks and adds the EOB
count. It intentionally stops before tree construction so that frequency
histogram correctness is independently testable.

`example/022-deflate-dynamic-litlen-balanced.asm` consumes `ll_freq[286]` and
emits a complete balanced `ll_len[286]` table. This is a validity scaffold, not
the final frequency-optimal Huffman tree: it assigns lengths from active symbol
count in symbol order. The point is to test native length-table scratch layout
and deflate-compatible complete code lengths before porting the sorted tree
builder.

`test/dynamic-huffman-reference-test.rkt` compiles tiny C/zlib harnesses and
verifies that zlib raw inflate accepts both Racket reference paths. It also
checks that the `020` asmp assembly output matches the fixed literal-only
reference byte-for-byte.

## asmp Implementation Plan

1. Keep the Racket reference encoder as the oracle for early dynamic assembly
   work.
2. Use `020-deflate-dynamic-litonly.asm` as the preserved dynamic-header
   baseline. It exercises the dynamic header and canonical-code writer without
   mixing in LZ77 parser risk.
3. Use `021-deflate-dynamic-litfreq.asm` as the native histogram baseline for
   the frequency-driven path. Keep it separate from `020` so the fixed header
   baseline remains available for debugging.
4. Use `022-deflate-dynamic-litlen-balanced.asm` as the native length-table
   scaffold. Replace its balanced assignment with frequency-sorted Huffman
   lengths only after the downstream header emitter can consume `ll_len`.
5. Add frequency tables to scratch:
   - `ll_freq[286] : uint32_t`
   - `dist_freq[30] : uint32_t`
   - `ll_len[286] : uint8_t`
   - `dist_len[30] : uint8_t`
   - `bl_freq[19] : uint32_t`
   - `bl_len[19] : uint8_t`
   - heap/parent/work arrays for length-limited tree build
6. Port general canonical code generation next. It is deterministic and small:
   count lengths, compute `next_code`, then assign codes in symbol order.
7. Port length-limited tree construction. Start with zlib's overflow repair
   style because it is easier to make assembly-friendly than package-merge.
8. Port code-length RLE (`16`, `17`, `18`) after the non-RLE assembly header
   path is correct. The Racket oracle already includes it.
9. Extend the block policy to choose stored/fixed/dynamic by measured bit cost.
   Dynamic should not automatically win; small blocks often lose to header
   overhead.

## First Correctness Targets

- Empty input still chooses fixed or stored in the public auto wrapper.
- Literal-only dynamic reference roundtrips through zlib.
- The `020` dynamic assembly wrapper matches the reference bytes and roundtrips
  high-literal data and ordinary text.
- The frequency-driven literal-only Racket reference roundtrips through zlib
  and unit-tests repeat symbols `16`, `17`, and `18`.
- The `021` assembly helper fills `ll_freq[286]` correctly for empty, text,
  high-literal, and binary inputs.
- The `022` assembly helper fills balanced `ll_len[286]` correctly from the
  native frequency table for the same input set.
- The quality gate records dynamic rows only after the public wrapper is safe
  under the C profile and generated header path.
