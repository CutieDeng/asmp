#lang racket

(require rackunit
         rackunit/text-ui
         racket/file
         racket/runtime-path)

(define-runtime-path cli-source "../cli/as.rkt")
(define-runtime-path word-extend-source "../example/023-deflate-fixed-chain-word-extend.asm")

(define harness-source
  #<<C
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <zlib.h>

#include "asmp_wordextend.h"

enum {
  ASMP_DEFLATE_OK = 0,
  ASMP_DEFLATE_DST_TOO_SMALL = 1,
  ASMP_DEFLATE_SCRATCH_TOO_SMALL = 2,
  ASMP_DEFLATE_BAD_ARGUMENT = 3
};

static int roundtrip(const char *name,
                     const uint8_t *src,
                     size_t len,
                     uint64_t expected_len) {
  uint64_t out_cap = asmp_deflate_word_extend_raw_bound((uint64_t)len);
  uint64_t scratch_len = asmp_deflate_word_extend_raw_scratch_size();
  uint8_t *compressed = calloc((size_t)out_cap, 1);
  uint8_t *decoded = calloc(len + 64, 1);
  void *scratch = calloc((size_t)scratch_len, 1);
  if (!compressed || !decoded || !scratch) {
    fprintf(stderr, "%s: allocation failed\n", name);
    return 1;
  }

  uint64_t clen = 0;
  int status = asmp_deflate_raw_fixed_word_extend(compressed,
                                                  out_cap,
                                                  &clen,
                                                  src,
                                                  (uint64_t)len,
                                                  scratch,
                                                  scratch_len);
  if (status != ASMP_DEFLATE_OK) {
    fprintf(stderr, "%s: status=%d clen=%llu\n", name, status,
            (unsigned long long)clen);
    return 1;
  }
  if (clen != expected_len) {
    fprintf(stderr, "%s: clen=%llu expected=%llu\n", name,
            (unsigned long long)clen, (unsigned long long)expected_len);
    return 1;
  }

  z_stream zs;
  memset(&zs, 0, sizeof(zs));
  int zr = inflateInit2(&zs, -MAX_WBITS);
  if (zr != Z_OK) {
    return 1;
  }
  zs.next_in = compressed;
  zs.avail_in = (uInt)clen;
  zs.next_out = decoded;
  zs.avail_out = (uInt)(len + 64);
  zr = inflate(&zs, Z_FINISH);
  if (zr != Z_STREAM_END) {
    fprintf(stderr, "%s: inflate=%d total_out=%lu clen=%llu\n", name, zr,
            (unsigned long)zs.total_out, (unsigned long long)clen);
    inflateEnd(&zs);
    return 1;
  }
  inflateEnd(&zs);

  if (zs.total_out != len || memcmp(decoded, src, len) != 0) {
    fprintf(stderr, "%s: decoded mismatch\n", name);
    return 1;
  }

  printf("%s/word-extend: %zu -> %llu bytes\n", name, len,
         (unsigned long long)clen);
  free(compressed);
  free(decoded);
  free(scratch);
  return 0;
}

static int status_checks(void) {
  static const uint8_t src[] = "status-check-input";
  uint64_t src_len = sizeof(src) - 1;
  uint64_t bound = asmp_deflate_word_extend_raw_bound(src_len);
  uint64_t scratch_len = asmp_deflate_word_extend_raw_scratch_size();
  uint8_t *dst = calloc((size_t)bound, 1);
  void *scratch = calloc((size_t)scratch_len, 1);
  uint64_t out_len = 99;
  int failed = 0;

  int status = asmp_deflate_raw_fixed_word_extend(NULL, bound, &out_len, src,
                                                  src_len, scratch, scratch_len);
  failed |= status != ASMP_DEFLATE_BAD_ARGUMENT;

  out_len = 99;
  status = asmp_deflate_raw_fixed_word_extend(dst, 1, &out_len, src, src_len,
                                              scratch, scratch_len);
  failed |= status != ASMP_DEFLATE_DST_TOO_SMALL || out_len != 0;

  out_len = 99;
  status = asmp_deflate_raw_fixed_word_extend(dst, bound, &out_len, src, src_len,
                                              scratch, 16);
  failed |= status != ASMP_DEFLATE_SCRATCH_TOO_SMALL || out_len != 0;

  out_len = 99;
  status = asmp_deflate_raw_fixed_word_extend(dst, bound, &out_len, NULL, 0,
                                              scratch, scratch_len);
  failed |= status != ASMP_DEFLATE_OK || out_len != 2;

  free(dst);
  free(scratch);
  return failed;
}

int main(void) {
  static const uint8_t empty[] = "";
  static const uint8_t small[] = "hello hello hello hello\n";

  static uint8_t repeated[4096];
  for (size_t i = 0; i < sizeof(repeated); i++) {
    repeated[i] = (uint8_t)("abcabcabcXYZXYZXYZ0123456789"[i % 30]);
  }

  static uint8_t period257[65536];
  for (size_t i = 0; i < 257; i++) {
    period257[i] = (uint8_t)((i * 131u + 7u) & 0xffu);
  }
  for (size_t i = 257; i < sizeof(period257); i++) {
    period257[i] = period257[i - 257];
  }

  static uint8_t binary[2048];
  for (size_t i = 0; i < sizeof(binary); i++) {
    binary[i] = (uint8_t)((i * 37u + (i >> 3)) & 0xffu);
  }

  static uint8_t long_repeat[70000];
  for (size_t i = 0; i < sizeof(long_repeat); i++) {
    long_repeat[i] = (uint8_t)("asmp-deflate-window-wrap-"[i % 25]);
  }

  int failed = 0;
  failed |= roundtrip("empty", empty, 0, 2);
  failed |= roundtrip("small", small, sizeof(small) - 1, 10);
  failed |= roundtrip("repeated", repeated, sizeof(repeated), 55);
  failed |= roundtrip("period257", period257, sizeof(period257), 908);
  failed |= roundtrip("binary", binary, sizeof(binary), 1196);
  failed |= roundtrip("long-repeat", long_repeat, sizeof(long_repeat), 571);
  failed |= status_checks();
  return failed ? 1 : 0;
}
C
  )

(define (native-macos-aarch64?)
  (and (eq? (system-type 'os) 'macosx)
       (eq? (system-type 'arch) 'aarch64)))

(define (run-command exe . args)
  (define ok? (apply system* exe args))
  (unless ok?
    (error 'deflate-word-extend-native-test "command failed: ~a ~a" exe args)))

(define (call-with-temp-dir proc)
  (define dir (make-temporary-file "asmp-deflate-word-extend-native-~a" 'directory))
  (dynamic-wind
    void
    (lambda () (proc dir))
    (lambda () (delete-directory/files dir))))

(define word-extend-native-tests
  (test-suite
   "native deflate word-extend roundtrip"

   (test-case "word-extend hash-chain deflate roundtrips through zlib on macOS arm64"
     (cond
       [(not (native-macos-aarch64?))
        (printf "skip native word-extend deflate roundtrip on ~a/~a\n"
                (system-type 'os)
                (system-type 'arch))
        (check-true #t)]
       [(not (find-executable-path "clang"))
        (printf "skip native word-extend deflate roundtrip: clang not found\n")
        (check-true #t)]
       [else
        (call-with-temp-dir
         (lambda (dir)
           (define asm-path (build-path dir "wordextend.s"))
           (define header-path (build-path dir "asmp_wordextend.h"))
           (define harness-path (build-path dir "harness.c"))
           (define exe-path (build-path dir "harness"))
           (call-with-output-file harness-path
             #:exists 'truncate/replace
             (lambda (out) (display harness-source out)))
           (run-command (find-executable-path "racket")
                        cli-source
                        "--gnu-input"
                        "--apple"
                        "--elim"
                        "--public-c-header"
                        header-path
                        "-o"
                        asm-path
                        word-extend-source)
           (run-command (find-executable-path "clang")
                        "-O2"
                        harness-path
                        asm-path
                        "-I"
                        dir
                        "-lz"
                        "-o"
                        exe-path)
           (run-command exe-path)
           (check-true #t)))]))))

(module+ main
  (void (run-tests word-extend-native-tests)))

(module+ test
  (void (run-tests word-extend-native-tests)))
