#lang racket

(require
 rackunit
 "../encode/loader.rkt"
 "../encode/encode.rkt"
 (only-in "../vendor/cutie-ftree/pvector.rkt"
          pvector?
          pvector-length))

(define here (path-only (syntax-source #'here)))
(define root (simplify-path (build-path here "..")))
(define config-dir (build-path root "encode" "config-generated"))

(define (rktd? p)
  (regexp-match? #rx"\\.rktd$" (path->string p)))

(define (config-paths)
  (for/list ([p (in-list (directory-list config-dir))]
             #:when (rktd? p))
    (build-path config-dir p)))

(define (run)
  (define seen (make-hash))
  (for ([p (in-list (config-paths))])
    (define encs (file->encodes p seen))
    ;; 允许空文件（如 sve.rktd 占位符）
    (check-true (pvector? encs))
  ))

(module+ test
  (run))
