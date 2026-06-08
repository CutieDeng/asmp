#lang racket

(require rackunit
         rackunit/text-ui
         racket/file
         racket/runtime-path
         "../research/deflate-optimization/dynamic-huffman-reference.rkt")

(define-runtime-path cli-source "../cli/as.rkt")
(define-runtime-path dynamic-litonly-source "../example/020-deflate-dynamic-litonly.asm")
(define-runtime-path dynamic-litfreq-source "../example/021-deflate-dynamic-litfreq.asm")
(define-runtime-path dynamic-litlen-source "../example/022-deflate-dynamic-litlen-balanced.asm")

(define (byte->c-hex byte)
  (define hex (string-upcase (number->string byte 16)))
  (format "0x~a" (if (= (string-length hex) 1)
                     (string-append "0" hex)
                     hex)))

(define (bytes->c-initializer data)
  (if (zero? (bytes-length data))
      "0"
      (string-join
       (for/list ([byte (in-bytes data)])
         (byte->c-hex byte))
       ", ")))

(define (harness-source compressed expected)
  (format
   #<<C
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <zlib.h>

static const uint8_t compressed[] = { ~a };
static const size_t compressed_len = ~a;
static const uint8_t expected[] = { ~a };
static const size_t expected_len = ~a;

int main(void) {
  size_t decoded_cap = expected_len + 64;
  uint8_t *decoded = calloc(decoded_cap == 0 ? 1 : decoded_cap, 1);
  if (!decoded) {
    return 1;
  }

  z_stream zs;
  memset(&zs, 0, sizeof(zs));
  int zr = inflateInit2(&zs, -MAX_WBITS);
  if (zr != Z_OK) {
    fprintf(stderr, "inflateInit2 failed: %d\n", zr);
    return 1;
  }

  zs.next_in = (Bytef *)compressed;
  zs.avail_in = (uInt)compressed_len;
  zs.next_out = decoded;
  zs.avail_out = (uInt)decoded_cap;
  zr = inflate(&zs, Z_FINISH);
  if (zr != Z_STREAM_END) {
    fprintf(stderr, "inflate failed: %d total_out=%lu total_in=%lu\n",
            zr, (unsigned long)zs.total_out, (unsigned long)zs.total_in);
    inflateEnd(&zs);
    return 1;
  }
  inflateEnd(&zs);

  if (zs.total_out != expected_len ||
      (expected_len != 0 && memcmp(decoded, expected, expected_len) != 0)) {
    fprintf(stderr, "decoded mismatch total_out=%lu expected=%zu\n",
            (unsigned long)zs.total_out, expected_len);
    return 1;
  }
  free(decoded);
  return 0;
}
C
   (bytes->c-initializer compressed)
   (bytes-length compressed)
   (bytes->c-initializer expected)
   (bytes-length expected)))

(define (asmp-harness-source input expected-compressed)
  (format
   #<<C
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <zlib.h>

#include "asmp_dynamic_litonly.h"

enum {
  ASMP_DEFLATE_OK = 0,
  ASMP_DEFLATE_DST_TOO_SMALL = 1,
  ASMP_DEFLATE_BAD_ARGUMENT = 3
};

static const uint8_t input[] = { ~a };
static const size_t input_len = ~a;
static const uint8_t expected_compressed[] = { ~a };
static const size_t expected_compressed_len = ~a;

static int verify_inflate(const uint8_t *compressed, uint64_t compressed_len) {
  size_t decoded_cap = input_len + 64;
  uint8_t *decoded = calloc(decoded_cap == 0 ? 1 : decoded_cap, 1);
  if (!decoded) {
    return 1;
  }

  z_stream zs;
  memset(&zs, 0, sizeof(zs));
  int zr = inflateInit2(&zs, -MAX_WBITS);
  if (zr != Z_OK) {
    fprintf(stderr, "inflateInit2 failed: %d\n", zr);
    return 1;
  }

  zs.next_in = (Bytef *)compressed;
  zs.avail_in = (uInt)compressed_len;
  zs.next_out = decoded;
  zs.avail_out = (uInt)decoded_cap;
  zr = inflate(&zs, Z_FINISH);
  if (zr != Z_STREAM_END) {
    fprintf(stderr, "inflate failed: %d total_out=%lu total_in=%lu\n",
            zr, (unsigned long)zs.total_out, (unsigned long)zs.total_in);
    inflateEnd(&zs);
    return 1;
  }
  inflateEnd(&zs);

  if (zs.total_out != input_len ||
      (input_len != 0 && memcmp(decoded, input, input_len) != 0)) {
    fprintf(stderr, "decoded mismatch total_out=%lu expected=%zu\n",
            (unsigned long)zs.total_out, input_len);
    return 1;
  }
  free(decoded);
  return 0;
}

int main(void) {
  uint64_t bound = asmp_deflate_raw_dynamic_litonly_bound((uint64_t)input_len);
  uint8_t *compressed = calloc((size_t)bound, 1);
  if (!compressed) {
    return 1;
  }

  uint64_t compressed_len = 0;
  int status = asmp_deflate_raw_dynamic_litonly(compressed,
                                               bound,
                                               &compressed_len,
                                               input,
                                               (uint64_t)input_len);
  if (status != ASMP_DEFLATE_OK) {
    fprintf(stderr, "asmp wrapper failed status=%d len=%llu\n",
            status, (unsigned long long)compressed_len);
    return 1;
  }
  if (compressed_len != expected_compressed_len ||
      memcmp(compressed, expected_compressed, expected_compressed_len) != 0) {
    fprintf(stderr, "compressed mismatch got=%llu expected=%zu\n",
            (unsigned long long)compressed_len, expected_compressed_len);
    return 1;
  }
  return verify_inflate(compressed, compressed_len);
}
C
   (bytes->c-initializer input)
   (bytes-length input)
   (bytes->c-initializer expected-compressed)
   (bytes-length expected-compressed)))

(define litfreq-harness-source
  #<<C
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "asmp_litfreq.h"

enum {
  ASMP_DEFLATE_OK = 0,
  ASMP_DEFLATE_SCRATCH_TOO_SMALL = 2,
  ASMP_DEFLATE_BAD_ARGUMENT = 3
};

static int expect_status(const char *name, int got, int expected) {
  if (got != expected) {
    fprintf(stderr, "%s: status=%d expected=%d\n", name, got, expected);
    return 1;
  }
  return 0;
}

static int check_case(const char *name, const uint8_t *data, size_t len) {
  uint32_t freq[286];
  uint32_t expected[286];
  for (size_t i = 0; i < 286; i++) {
    freq[i] = 0xccccccccu;
    expected[i] = 0;
  }
  for (size_t i = 0; i < len; i++) {
    expected[data[i]]++;
  }
  expected[256] = 1;

  int status = asmp_deflate_dynamic_litfreq_count(data,
                                                  (uint64_t)len,
                                                  freq,
                                                  sizeof(freq));
  if (status != ASMP_DEFLATE_OK) {
    fprintf(stderr, "%s: wrapper failed status=%d\n", name, status);
    return 1;
  }
  for (size_t i = 0; i < 286; i++) {
    if (freq[i] != expected[i]) {
      fprintf(stderr, "%s: freq[%zu]=%u expected=%u\n",
              name, i, freq[i], expected[i]);
      return 1;
    }
  }
  return 0;
}

static int status_checks(void) {
  static const uint8_t data[] = "status";
  uint32_t freq[286];
  int failed = 0;

  failed |= expect_status(
      "bad-src",
      asmp_deflate_dynamic_litfreq_count(NULL, 1, freq, sizeof(freq)),
      ASMP_DEFLATE_BAD_ARGUMENT);
  failed |= expect_status(
      "bad-freq",
      asmp_deflate_dynamic_litfreq_count(data, sizeof(data) - 1, NULL, sizeof(freq)),
      ASMP_DEFLATE_BAD_ARGUMENT);
  failed |= expect_status(
      "small-freq",
      asmp_deflate_dynamic_litfreq_count(data, sizeof(data) - 1, freq, 4),
      ASMP_DEFLATE_SCRATCH_TOO_SMALL);
  failed |= check_case("empty-null-src", NULL, 0);
  return failed;
}

int main(void) {
  static const uint8_t text[] = "hello hello dynamic huffman\n";
  static uint8_t high_literals[112];
  for (size_t i = 0; i < sizeof(high_literals); i++) {
    high_literals[i] = (uint8_t)(144u + i);
  }
  static uint8_t binary[2048];
  for (size_t i = 0; i < sizeof(binary); i++) {
    binary[i] = (uint8_t)((i * 37u + (i >> 3)) & 0xffu);
  }

  int failed = 0;
  failed |= check_case("empty", (const uint8_t *)"", 0);
  failed |= check_case("text", text, sizeof(text) - 1);
  failed |= check_case("high-literals", high_literals, sizeof(high_literals));
  failed |= check_case("binary", binary, sizeof(binary));
  failed |= status_checks();
  return failed ? 1 : 0;
}
C
  )

(define litlen-harness-source
  #<<C
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int asmp_deflate_dynamic_litfreq_count(const uint8_t *src,
                                              uint64_t src_len,
                                              void *freq_ptr,
                                              uint64_t freq_len);
extern int asmp_deflate_dynamic_litlen_balanced(void *freq_ptr,
                                                uint64_t freq_len,
                                                void *len_ptr,
                                                uint64_t len_len);

enum {
  ASMP_DEFLATE_OK = 0,
  ASMP_DEFLATE_SCRATCH_TOO_SMALL = 2,
  ASMP_DEFLATE_BAD_ARGUMENT = 3
};

static int expect_status(const char *name, int got, int expected) {
  if (got != expected) {
    fprintf(stderr, "%s: status=%d expected=%d\n", name, got, expected);
    return 1;
  }
  return 0;
}

static void expected_balanced_lengths(const uint32_t *freq, uint8_t *expected) {
  memset(expected, 0, 286);
  uint64_t active = 0;
  for (size_t i = 0; i < 286; i++) {
    if (freq[i] != 0) {
      active++;
    }
  }
  if (active == 0) {
    return;
  }
  if (active <= 2) {
    for (size_t i = 0; i < 286; i++) {
      if (freq[i] != 0) {
        expected[i] = 1;
      }
    }
    if (active == 1) {
      expected[freq[0] == 0 ? 0 : 1] = 1;
    }
    return;
  }

  uint64_t pow2 = 1;
  uint8_t long_len = 0;
  while (pow2 < active) {
    pow2 += pow2;
    long_len++;
  }
  uint8_t short_len = (uint8_t)(long_len - 1);
  uint64_t short_remaining = pow2 - active;
  for (size_t i = 0; i < 286; i++) {
    if (freq[i] == 0) {
      continue;
    }
    if (short_remaining != 0) {
      expected[i] = short_len;
      short_remaining--;
    } else {
      expected[i] = long_len;
    }
  }
}

static int check_case(const char *name, const uint8_t *data, size_t len) {
  uint32_t freq[286];
  uint8_t lengths[286];
  uint8_t expected[286];

  int status = asmp_deflate_dynamic_litfreq_count(data,
                                                  (uint64_t)len,
                                                  freq,
                                                  sizeof(freq));
  if (status != ASMP_DEFLATE_OK) {
    fprintf(stderr, "%s: litfreq status=%d\n", name, status);
    return 1;
  }

  memset(lengths, 0xcc, sizeof(lengths));
  status = asmp_deflate_dynamic_litlen_balanced(freq,
                                                sizeof(freq),
                                                lengths,
                                                sizeof(lengths));
  if (status != ASMP_DEFLATE_OK) {
    fprintf(stderr, "%s: litlen status=%d\n", name, status);
    return 1;
  }

  expected_balanced_lengths(freq, expected);
  for (size_t i = 0; i < 286; i++) {
    if (lengths[i] != expected[i]) {
      fprintf(stderr, "%s: len[%zu]=%u expected=%u freq=%u\n",
              name, i, lengths[i], expected[i], freq[i]);
      return 1;
    }
  }
  return 0;
}

static int status_checks(void) {
  uint32_t freq[286] = {0};
  uint8_t lengths[286];
  int failed = 0;

  failed |= expect_status(
      "bad-freq",
      asmp_deflate_dynamic_litlen_balanced(NULL, sizeof(freq), lengths, sizeof(lengths)),
      ASMP_DEFLATE_BAD_ARGUMENT);
  failed |= expect_status(
      "bad-len",
      asmp_deflate_dynamic_litlen_balanced(freq, sizeof(freq), NULL, sizeof(lengths)),
      ASMP_DEFLATE_BAD_ARGUMENT);
  failed |= expect_status(
      "small-freq",
      asmp_deflate_dynamic_litlen_balanced(freq, 4, lengths, sizeof(lengths)),
      ASMP_DEFLATE_SCRATCH_TOO_SMALL);
  failed |= expect_status(
      "small-len",
      asmp_deflate_dynamic_litlen_balanced(freq, sizeof(freq), lengths, 4),
      ASMP_DEFLATE_SCRATCH_TOO_SMALL);
  return failed;
}

int main(void) {
  static const uint8_t text[] = "hello hello dynamic huffman\n";
  static uint8_t high_literals[112];
  for (size_t i = 0; i < sizeof(high_literals); i++) {
    high_literals[i] = (uint8_t)(144u + i);
  }
  static uint8_t binary[2048];
  for (size_t i = 0; i < sizeof(binary); i++) {
    binary[i] = (uint8_t)((i * 37u + (i >> 3)) & 0xffu);
  }

  int failed = 0;
  failed |= check_case("empty", (const uint8_t *)"", 0);
  failed |= check_case("text", text, sizeof(text) - 1);
  failed |= check_case("high-literals", high_literals, sizeof(high_literals));
  failed |= check_case("binary", binary, sizeof(binary));
  failed |= status_checks();
  return failed ? 1 : 0;
}
C
  )

(define (run-command exe . args)
  (define ok? (apply system* exe args))
  (unless ok?
    (error 'dynamic-huffman-reference-test "command failed: ~a ~a" exe args)))

(define (call-with-temp-dir proc)
  (define dir (make-temporary-file "asmp-dynamic-huffman-reference-~a" 'directory))
  (dynamic-wind
    void
    (lambda () (proc dir))
    (lambda () (delete-directory/files dir))))

(define (check-zlib-roundtrip name input [encoder dynamic-litonly-raw-deflate])
  (define clang (find-executable-path "clang"))
  (cond
    [(not clang)
     (printf "skip dynamic Huffman reference ~a: clang not found\n" name)
     (check-true #t)]
    [else
     (call-with-temp-dir
      (lambda (dir)
        (define compressed (encoder input))
        (define harness-path (build-path dir "harness.c"))
        (define exe-path (build-path dir "harness"))
        (call-with-output-file harness-path
          #:exists 'truncate/replace
          (lambda (out) (display (harness-source compressed input) out)))
        (run-command clang harness-path "-lz" "-o" exe-path)
        (run-command exe-path)
        (check-true (> (bytes-length compressed) 0))))]))

(define (check-asmp-roundtrip name input)
  (define clang (find-executable-path "clang"))
  (define racket-exe (find-executable-path "racket"))
  (cond
    [(not clang)
     (printf "skip dynamic Huffman asmp ~a: clang not found\n" name)
     (check-true #t)]
    [(not racket-exe)
     (printf "skip dynamic Huffman asmp ~a: racket not found\n" name)
     (check-true #t)]
    [else
     (call-with-temp-dir
      (lambda (dir)
        (define asm-path (build-path dir "dynamic-litonly.s"))
        (define header-path (build-path dir "asmp_dynamic_litonly.h"))
        (define harness-path (build-path dir "harness.c"))
        (define exe-path (build-path dir "harness"))
        (define compressed (dynamic-litonly-raw-deflate input))
        (run-command racket-exe
                     cli-source
                     "--gnu-input"
                     "--apple"
                     "--elim"
                     "--public-c-header"
                     header-path
                     "-o"
                     asm-path
                     dynamic-litonly-source)
        (call-with-output-file harness-path
          #:exists 'truncate/replace
          (lambda (out) (display (asmp-harness-source input compressed) out)))
        (run-command clang harness-path asm-path "-I" dir "-lz" "-o" exe-path)
        (run-command exe-path)
        (check-true (> (bytes-length compressed) 0))))]))

(define (check-asmp-litfreq)
  (define clang (find-executable-path "clang"))
  (define racket-exe (find-executable-path "racket"))
  (cond
    [(not clang)
     (printf "skip dynamic Huffman litfreq helper: clang not found\n")
     (check-true #t)]
    [(not racket-exe)
     (printf "skip dynamic Huffman litfreq helper: racket not found\n")
     (check-true #t)]
    [else
     (call-with-temp-dir
      (lambda (dir)
        (define asm-path (build-path dir "litfreq.s"))
        (define header-path (build-path dir "asmp_litfreq.h"))
        (define harness-path (build-path dir "harness.c"))
        (define exe-path (build-path dir "harness"))
        (run-command racket-exe
                     cli-source
                     "--gnu-input"
                     "--apple"
                     "--elim"
                     "--public-c-header"
                     header-path
                     "-o"
                     asm-path
                     dynamic-litfreq-source)
        (call-with-output-file harness-path
          #:exists 'truncate/replace
          (lambda (out) (display litfreq-harness-source out)))
        (run-command clang harness-path asm-path "-I" dir "-o" exe-path)
        (run-command exe-path)
        (check-true #t)))]))

(define (check-asmp-litlen)
  (define clang (find-executable-path "clang"))
  (define racket-exe (find-executable-path "racket"))
  (cond
    [(not clang)
     (printf "skip dynamic Huffman litlen helper: clang not found\n")
     (check-true #t)]
    [(not racket-exe)
     (printf "skip dynamic Huffman litlen helper: racket not found\n")
     (check-true #t)]
    [else
     (call-with-temp-dir
      (lambda (dir)
        (define litfreq-asm-path (build-path dir "litfreq.s"))
        (define litlen-asm-path (build-path dir "litlen.s"))
        (define harness-path (build-path dir "harness.c"))
        (define exe-path (build-path dir "harness"))
        (run-command racket-exe
                     cli-source
                     "--gnu-input"
                     "--apple"
                     "--elim"
                     "-o"
                     litfreq-asm-path
                     dynamic-litfreq-source)
        (run-command racket-exe
                     cli-source
                     "--gnu-input"
                     "--apple"
                     "--elim"
                     "-o"
                     litlen-asm-path
                     dynamic-litlen-source)
        (call-with-output-file harness-path
          #:exists 'truncate/replace
          (lambda (out) (display litlen-harness-source out)))
        (run-command clang harness-path litfreq-asm-path litlen-asm-path "-o" exe-path)
        (run-command exe-path)
        (check-true #t)))]))

(define dynamic-huffman-reference-tests
  (test-suite
   "dynamic Huffman reference encoder"

   (test-case "canonical codes are assigned in symbol order within each length"
     (define codes (canonical-codes '(2 2 3 0 3)))
     (check-equal? (vector-ref codes 0) (cons 0 2))
     (check-equal? (vector-ref codes 1) (cons 1 2))
     (check-equal? (vector-ref codes 2) (cons 4 3))
     (check-false (vector-ref codes 3))
     (check-equal? (vector-ref codes 4) (cons 5 3)))

   (test-case "literal-only dynamic block roundtrips through zlib"
     (check-zlib-roundtrip "empty" #"")
     (check-zlib-roundtrip "text" #"hello hello hello\n")
     (check-zlib-roundtrip
      "high-literals"
      (apply bytes (for/list ([i (in-range 112)]) (+ 144 i)))))

   (test-case "frequency-driven literal-only dynamic block roundtrips through zlib"
     (check-zlib-roundtrip
      "empty/frequency"
      #""
      dynamic-literal-frequency-raw-deflate)
     (check-zlib-roundtrip
      "skewed/frequency"
      #"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabz"
      dynamic-literal-frequency-raw-deflate)
     (check-zlib-roundtrip
      "high-literals/frequency"
      (apply bytes (for/list ([i (in-range 112)]) (+ 144 i)))
     dynamic-literal-frequency-raw-deflate))

   (test-case "frequency-driven lengths favor common literals"
     (define compressed (dynamic-literal-frequency-raw-deflate
                         #"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabz"))
     (check-true (> (bytes-length compressed) 0))
     (define ll-lengths
       (literal-frequency-lengths #"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabz"))
     (check-true (<= (list-ref ll-lengths (char->integer #\a))
                     (list-ref ll-lengths (char->integer #\b))))
     (check-true (<= (list-ref ll-lengths (char->integer #\a))
                     (list-ref ll-lengths (char->integer #\z)))))

   (test-case "code-length RLE uses deflate repeat symbols"
     (define events
       (code-length-rle-events
        (append (make-list 20 0)
                (make-list 5 7)
                (make-list 4 0))))
     (check-true
      (for/or ([event (in-list events)])
        (= (cl-event-symbol event) 18)))
     (check-true
      (for/or ([event (in-list events)])
        (= (cl-event-symbol event) 16)))
     (check-true
      (for/or ([event (in-list events)])
        (= (cl-event-symbol event) 17))))

   (test-case "asmp literal-only dynamic block matches the reference stream"
     (check-asmp-roundtrip "empty" #"")
     (check-asmp-roundtrip "text" #"hello hello hello\n")
     (check-asmp-roundtrip
      "high-literals"
      (apply bytes (for/list ([i (in-range 112)]) (+ 144 i)))))

   (test-case "asmp literal-frequency helper fills ll_freq"
     (check-asmp-litfreq))

   (test-case "asmp balanced literal-length helper fills ll_len"
     (check-asmp-litlen))))

(module+ main
  (void (run-tests dynamic-huffman-reference-tests)))

(module+ test
  (void (run-tests dynamic-huffman-reference-tests)))
