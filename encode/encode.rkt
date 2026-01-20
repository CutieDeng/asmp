#lang racket

(require
 (only-in "../vendor/cutie-ftree/ordered-map.rkt" ordered-map?)
 (only-in "../vendor/cutie-ftree/pvector.rkt" pvector?))

(provide
 (struct-out encode)
 (struct-out encode-field)
 encode/c
 ordered-mapof
 encode-tags/c
 encode-field/c
 encode-fields/c)

(define ordered-mapof ordered-map?)

(define encode-tags/c ordered-map?)

(struct encode-field (name len lo hi) #:transparent)

(define encode-field/c
  (struct/c encode-field (or/c string? #f) exact-nonnegative-integer?
            exact-nonnegative-integer? exact-nonnegative-integer?))
(define encode-fields/c pvector?)

(struct encode (name tags encodings) #:transparent)

(define encode/c (struct/c encode string? encode-tags/c encode-fields/c))
