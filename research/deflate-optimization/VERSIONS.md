# Deflate Version Registry

Each row is a preserved implementation. New optimization ideas should add a
new row instead of replacing an older source file.

| Version | Source | Symbol | Scratch ABI | Status | Notes |
|---------|--------|--------|-------------|--------|-------|
| v0 | `example/009-deflate-fixed-fast.d` | `deflate_fixed_fast_aarch64` | `head[32768]` | pipeline example | S-expression bootstrap version. |
| v1 | `example/013-deflate-fixed-fast.asm` | `deflate_fixed_fast_aarch64_asm` | `head[32768]` | compile/assemble baseline | GNU `.asm`, one candidate per hash bucket. It is preserved for reading and pipeline comparison, but is not the native correctness baseline. |
| v2 | `example/019-deflate-fixed-chain.asm` | `deflate_fixed_chain_aarch64_asm` | `head[32768]`, `prev[32768]` | native roundtrip and benchmark baseline | Bounded hash chain with skipped-byte reinsertion and one-byte lazy lookahead. |
| stored-v0 | `example/019-deflate-fixed-chain.asm` | `deflate_stored_aarch64_asm` | none | native roundtrip and benchmark baseline | Raw stored-block encoder, split into 65535-byte stored blocks as required by deflate. |
| public-v0 | `example/019-deflate-fixed-chain.asm` | `asmp_deflate_raw_fixed` | caller scratch, currently `head[32768] + prev[32768]` | managed-signature public C wrapper and benchmark baseline | Returns status, writes `dst_len`, checks `dst_cap` and scratch size, calls v2 internally, and is the entrypoint used by the native compare runner. |
| public-stored-v0 | `example/019-deflate-fixed-chain.asm` | `asmp_deflate_raw_stored` | none | managed-signature public C wrapper and benchmark baseline | Returns status, writes `dst_len`, checks `dst_cap`, and calls stored-v0 internally. |
| public-auto-v0 | `example/019-deflate-fixed-chain.asm` | `asmp_deflate_raw_auto` | caller scratch, currently `head[32768] + prev[32768]` | managed-signature public C wrapper and benchmark baseline | Emits fixed output, compares it with exact stored length, and rewrites as stored if stored is no larger. This is a whole-stream selector, not a block-level dynamic policy. |
| dynamic-litonly-v0 | `example/020-deflate-dynamic-litonly.asm` | `asmp_deflate_raw_dynamic_litonly` | none | native roundtrip and reference-byte match | Emits one literal-only dynamic block with a fixed complete dynamic tree. This proves dynamic header and canonical-code emission, not compression quality. |
| dynamic-litfreq-v0 | `example/021-deflate-dynamic-litfreq.asm` | `asmp_deflate_dynamic_litfreq_count` | caller-provided `ll_freq[286]` | native frequency-table validation | Fills literal/length frequencies and EOB count for the future dynamic tree builder. It does not emit a deflate stream. |
| dynamic-litlen-balanced-v0 | `example/022-deflate-dynamic-litlen-balanced.asm` | `asmp_deflate_dynamic_litlen_balanced` | caller-provided `ll_freq[286] + ll_len[286]` | native length-table validation | Produces a valid balanced literal/length code-length table from active symbols. This is not frequency-optimal Huffman yet; it is a native scaffold for later tree build. |
| word-extend-v0 | `example/023-deflate-fixed-chain-word-extend.asm` | `asmp_deflate_raw_fixed_word_extend` | caller scratch, currently `head[32768] + prev[32768]` | native roundtrip and benchmark baseline | Preserves the 019 parser policy and fixed-Huffman output but changes LZ77 match extension from byte-at-a-time to 8-byte chunk compare plus `rbit`/`clz` mismatch location. |
| neon-extend-v0 | `example/024-deflate-fixed-chain-neon-extend.asm` | `asmp_deflate_raw_fixed_neon_extend` | caller scratch, currently `head[32768] + prev[32768]` | native roundtrip and benchmark baseline | Preserves the 023 parser policy and compressed output, but skips equal 16-byte match chunks with NEON `ldr q` / `eor v.16b` / `umaxv` before falling back to the scalar 8-byte mismatch locator. The core implementation is a hand-written `source-variant` with `feature=neon`; public wrappers select it through logical `.call` hints instead of naming the concrete core directly. |

## ABI Notes

All current versions return the number of compressed bytes in `x0`.

The public wrapper returns a status code in `w0` and writes the compressed size
through `dst_len`.

`013` C prototype:

```c
uint64_t deflate_fixed_fast_aarch64_asm(uint8_t *dst,
                                        const uint8_t *src,
                                        uint64_t len,
                                        uint32_t *head);
```

`019` C prototype:

```c
uint64_t deflate_fixed_chain_aarch64_asm(uint8_t *dst,
                                         const uint8_t *src,
                                         uint64_t len,
                                         uint32_t *head,
                                         uint32_t *prev);
```

Public wrapper C prototype:

```c
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

uint64_t asmp_deflate_raw_dynamic_litonly_bound(uint64_t src_len);

int asmp_deflate_raw_dynamic_litonly(uint8_t *dst,
                                     uint64_t dst_cap,
                                     uint64_t *dst_len,
                                     const uint8_t *src,
                                     uint64_t src_len);

int asmp_deflate_dynamic_litfreq_count(const uint8_t *src,
                                       uint64_t src_len,
                                       void *freq_ptr,
                                       uint64_t freq_len);

int asmp_deflate_dynamic_litlen_balanced(void *freq_ptr,
                                         uint64_t freq_len,
                                         void *len_ptr,
                                         uint64_t len_len);

uint64_t asmp_deflate_word_extend_raw_bound(uint64_t src_len);

uint64_t asmp_deflate_word_extend_raw_scratch_size(void);

int asmp_deflate_raw_fixed_word_extend(uint8_t *dst,
                                       uint64_t dst_cap,
                                       uint64_t *dst_len,
                                       const uint8_t *src,
                                       uint64_t src_len,
                                       void *scratch,
                                       uint64_t scratch_len);

uint64_t asmp_deflate_neon_extend_raw_bound(uint64_t src_len);

uint64_t asmp_deflate_neon_extend_raw_scratch_size(void);

int asmp_deflate_raw_fixed_neon_extend(uint8_t *dst,
                                       uint64_t dst_cap,
                                       uint64_t *dst_len,
                                       const uint8_t *src,
                                       uint64_t src_len,
                                       void *scratch,
                                       uint64_t scratch_len);
```

## Version Naming

Use numbered source files for algorithm versions:

```text
020-deflate-reinsert.asm
021-deflate-lazy.asm
022-deflate-word-extend.asm
```

Keep exported symbols unique. This lets benchmark harnesses link multiple
versions into one executable for side-by-side comparison.

## Native Benchmark Inclusion

`bench-native.rkt` should include only versions that are safe to call from a C
harness and pass raw-deflate roundtrip. Older preserved versions can remain in
this registry without being executed by the native benchmark.
