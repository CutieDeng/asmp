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
(define config-dir (build-path root "encode" "config"))

(define (rktd? p)
  (regexp-match? #rx"\\.rktd$" (path->string p)))

(define (config-paths)
  (for/list ([p (in-list (directory-list config-dir))]
             #:when (rktd? p))
    (build-path config-dir p)))

(define (run)
  (for ([p (in-list (config-paths))])
    (define encs (file->encodes p))
    (check-true (and (pvector? encs) (>= (pvector-length encs) 1)))
  ))

(module+ test
  (run))
