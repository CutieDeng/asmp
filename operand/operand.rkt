#lang racket

(provide
  (struct-out reg:p)
  (struct-out reg:v)
  (struct-out reg)
  (struct-out pred-reg)
  reg-class/c
  pred-mode/c
  pred-mask/c
  detail/c
  reg/c
  pred-reg/c
)

(struct reg:p (id) #:transparent)
(struct reg:v (id) #:transparent)

(define reg-class/c (or/c 'x 'w 'z))
(define detail/c (or/c reg:p? reg:v?))

(struct reg (class detail) #:transparent)
(struct pred-reg (p mode mask detail) #:transparent)

(define reg/c (struct/c reg reg-class/c detail/c))
(define pred-mode/c (or/c #f 'B 'H 'W 'D))
(define pred-mask/c (or/c #f 'm 'z))
(define pred-reg/c (struct/c pred-reg any/c pred-mode/c pred-mask/c detail/c))
