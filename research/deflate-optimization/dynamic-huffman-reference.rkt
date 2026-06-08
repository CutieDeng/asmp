#lang racket

(provide canonical-codes
         huffman-code-lengths
         code-length-rle-events
         (struct-out cl-event)
         dynamic-litonly-raw-deflate
         dynamic-literal-frequency-raw-deflate
         literal-frequency-lengths
         dynamic-litonly-literal-lengths)

(define code-length-order
  '(16 17 18 0 8 7 9 6 10 5 11 4 12 3 13 2 14 1 15))

;; A complete literal/length tree with all literal bytes and EOB present:
;; 226 * 2^-8 + 60 * 2^-9 = 1.  This is deliberately not frequency-optimal;
;; it is the smallest reference tree that keeps the dynamic block machinery
;; unambiguous before the real length-limited tree builder lands.
(define dynamic-litonly-literal-lengths
  (append (make-list 226 8)
          (make-list 60 9)))

(define dynamic-litonly-distance-lengths
  '(0))

(define dynamic-litonly-code-length-lengths
  (append (make-list 16 4)
          (make-list 3 0)))

(struct huff-node (freq tie symbol left right) #:transparent)
(struct cl-event (symbol extra extra-bits) #:transparent)

(define (node<? left right)
  (or (< (huff-node-freq left) (huff-node-freq right))
      (and (= (huff-node-freq left) (huff-node-freq right))
           (< (huff-node-tie left) (huff-node-tie right)))))

(define (insert-node node nodes)
  (cond
    [(null? nodes) (list node)]
    [(node<? node (car nodes)) (cons node nodes)]
    [else (cons (car nodes) (insert-node node (cdr nodes)))]))

(define (sorted-nodes nodes)
  (foldl insert-node '() nodes))

(define (first-unused-symbol freqs used)
  (for/first ([symbol (in-range (vector-length freqs))]
              #:unless (hash-has-key? used symbol))
    symbol))

(define (active-frequency-symbols freqs)
  (for/list ([freq (in-vector freqs)]
             [symbol (in-naturals)]
             #:when (positive? freq))
    symbol))

(define (huffman-tree-lengths freqs)
  (define leaves
    (for/list ([freq (in-vector freqs)]
               [symbol (in-naturals)]
               #:when (positive? freq))
      (huff-node freq symbol symbol #f #f)))
  (define root
    (let loop ([nodes (sorted-nodes leaves)])
      (cond
        [(null? nodes) #f]
        [(null? (cdr nodes)) (car nodes)]
        [else
         (define a (car nodes))
         (define b (cadr nodes))
         (define parent
           (huff-node (+ (huff-node-freq a) (huff-node-freq b))
                      (min (huff-node-tie a) (huff-node-tie b))
                      #f
                      a
                      b))
         (loop (insert-node parent (cddr nodes)))])))
  (define lengths (make-vector (vector-length freqs) 0))
  (define (walk node depth)
    (cond
      [(not node) (void)]
      [(huff-node-symbol node)
       (vector-set! lengths (huff-node-symbol node) (max depth 1))]
      [else
       (walk (huff-node-left node) (add1 depth))
       (walk (huff-node-right node) (add1 depth))]))
  (walk root 0)
  lengths)

(define (limit-length-counts raw-lengths freqs max-bits)
  (define bl-count (make-vector (add1 max-bits) 0))
  (define overflow 0)
  (for ([len (in-vector raw-lengths)]
        [freq (in-vector freqs)]
        #:when (positive? freq))
    (cond
      [(> len max-bits)
       (vector-set! bl-count max-bits
                    (add1 (vector-ref bl-count max-bits)))
       (set! overflow (add1 overflow))]
      [else
       (vector-set! bl-count len (add1 (vector-ref bl-count len)))]))
  (let loop ()
    (when (positive? overflow)
      (define bits
        (for/first ([candidate (in-range (sub1 max-bits) 0 -1)]
                    #:when (positive? (vector-ref bl-count candidate)))
          candidate))
      (unless bits
        (error 'huffman-code-lengths
               "cannot repair Huffman length overflow for max bits ~a"
               max-bits))
      (vector-set! bl-count bits (sub1 (vector-ref bl-count bits)))
      (vector-set! bl-count (add1 bits)
                   (+ (vector-ref bl-count (add1 bits)) 2))
      (vector-set! bl-count max-bits
                   (sub1 (vector-ref bl-count max-bits)))
      (set! overflow (- overflow 2))
      (loop)))
  bl-count)

(define (assign-limited-lengths freqs bl-count)
  (define lengths (make-vector (vector-length freqs) 0))
  (define symbols
    (sort
     (for/list ([freq (in-vector freqs)]
                [symbol (in-naturals)]
                #:when (positive? freq))
       (cons symbol freq))
     (lambda (a b)
       (or (< (cdr a) (cdr b))
           (and (= (cdr a) (cdr b))
                (> (car a) (car b)))))))
  (define remaining symbols)
  (for ([bits (in-range (sub1 (vector-length bl-count)) 0 -1)])
    (for ([_ (in-range (vector-ref bl-count bits))])
      (when (null? remaining)
        (error 'huffman-code-lengths "length count exceeds active symbol count"))
      (vector-set! lengths (caar remaining) bits)
      (set! remaining (cdr remaining))))
  (unless (null? remaining)
    (error 'huffman-code-lengths "not all active symbols received lengths"))
  lengths)

(define (huffman-code-lengths frequencies max-bits #:min-codes [min-codes 2])
  (define freqs (vector-copy frequencies))
  (define active (active-frequency-symbols freqs))
  (when (zero? (length active))
    (error 'huffman-code-lengths "at least one frequency is required"))
  (let loop ()
    (when (< (length (active-frequency-symbols freqs)) min-codes)
      (define used (for/hash ([symbol (in-list (active-frequency-symbols freqs))])
                     (values symbol #t)))
      (define dummy (first-unused-symbol freqs used))
      (unless dummy
        (error 'huffman-code-lengths "cannot add dummy symbol"))
      (vector-set! freqs dummy 1)
      (loop)))
  (define raw-lengths (huffman-tree-lengths freqs))
  (define max-raw (for/fold ([m 0]) ([len (in-vector raw-lengths)]) (max m len)))
  (if (<= max-raw max-bits)
      raw-lengths
      (assign-limited-lengths
       freqs
       (limit-length-counts raw-lengths freqs max-bits))))

(define (bit-reverse value width)
  (for/fold ([result 0])
            ([i (in-range width)])
    (bitwise-ior (arithmetic-shift result 1)
                 (bitwise-and (arithmetic-shift value (- i)) 1))))

(define (canonical-codes lengths)
  (define max-bits (if (null? lengths) 0 (apply max lengths)))
  (define bl-count (make-vector (add1 max-bits) 0))
  (for ([len (in-list lengths)]
        #:when (positive? len))
    (vector-set! bl-count len (add1 (vector-ref bl-count len))))
  (define next-code (make-vector (add1 max-bits) 0))
  (define code 0)
  (for ([bits (in-range 1 (add1 max-bits))])
    (set! code (arithmetic-shift (+ code (vector-ref bl-count (sub1 bits))) 1))
    (vector-set! next-code bits code))
  (define codes (make-vector (length lengths) #f))
  (for ([len (in-list lengths)]
        [symbol (in-naturals)]
        #:when (positive? len))
    (define symbol-code (vector-ref next-code len))
    (vector-set! codes symbol (cons symbol-code len))
    (vector-set! next-code len (add1 symbol-code)))
  codes)

(define (last-positive-index lengths)
  (for/fold ([last #f])
            ([len (in-list lengths)]
             [index (in-naturals)])
    (if (positive? len) index last)))

(define (trim-code-count lengths min-count)
  (max min-count (add1 (or (last-positive-index lengths) 0))))

(define (list-take-count items count)
  (for/list ([item (in-list items)]
             [_ (in-range count)])
    item))

(define (run-length-at items start)
  (define value (list-ref items start))
  (let loop ([index start])
    (if (and (< index (length items))
             (= (list-ref items index) value))
        (loop (add1 index))
        (- index start))))

(define (code-length-rle-events lengths)
  (define n (length lengths))
  (let loop ([index 0] [events '()])
    (cond
      [(>= index n) (reverse events)]
      [else
       (define len (list-ref lengths index))
       (define run (run-length-at lengths index))
       (cond
         [(zero? len)
          (let zero-loop ([left run] [acc events])
            (cond
              [(>= left 11)
               (define count (min left 138))
               (zero-loop (- left count)
                          (cons (cl-event 18 (- count 11) 7) acc))]
              [(>= left 3)
               (define count (min left 10))
               (zero-loop (- left count)
                          (cons (cl-event 17 (- count 3) 3) acc))]
              [(positive? left)
               (zero-loop (sub1 left)
                          (cons (cl-event 0 0 0) acc))]
              [else
               (loop (+ index run) acc)]))]
         [else
          (let nonzero-loop ([left (sub1 run)]
                             [acc (cons (cl-event len 0 0) events)])
            (cond
              [(>= left 3)
               (define count (min left 6))
               (nonzero-loop (- left count)
                             (cons (cl-event 16 (- count 3) 2) acc))]
              [(positive? left)
               (nonzero-loop (sub1 left)
                             (cons (cl-event len 0 0) acc))]
              [else
               (loop (+ index run) acc)]))])])))

(define (make-bit-writer)
  (define bits '())
  (define (write-bits value width)
    (for ([i (in-range width)])
      (set! bits
            (cons (bitwise-and (arithmetic-shift value (- i)) 1)
                  bits))))
  (define (write-code codes symbol)
    (define entry (vector-ref codes symbol))
    (unless entry
      (error 'dynamic-litonly-raw-deflate "symbol has no code: ~a" symbol))
    (define code (car entry))
    (define width (cdr entry))
    (write-bits (bit-reverse code width) width))
  (define (finish)
    (define ordered (list->vector (reverse bits)))
    (define byte-count (quotient (+ (vector-length ordered) 7) 8))
    (define out (make-bytes byte-count 0))
    (for ([i (in-range (vector-length ordered))])
      (when (= (vector-ref ordered i) 1)
        (define byte-index (quotient i 8))
        (define bit-index (remainder i 8))
        (bytes-set! out byte-index
                    (bitwise-ior (bytes-ref out byte-index)
                                 (arithmetic-shift 1 bit-index)))))
    out)
  (values write-bits write-code finish))

(define (dynamic-litonly-raw-deflate input)
  (unless (bytes? input)
    (raise-argument-error 'dynamic-litonly-raw-deflate "bytes?" input))
  (define src input)
  (define-values (write-bits write-code finish) (make-bit-writer))
  (define cl-codes (canonical-codes dynamic-litonly-code-length-lengths))
  (define ll-codes (canonical-codes dynamic-litonly-literal-lengths))

  ;; BFINAL=1, BTYPE=10. Bits are emitted least-significant first.
  (write-bits #b101 3)
  (write-bits 29 5) ; HLIT: 286 literal/length codes - 257
  (write-bits 0 5)  ; HDIST: one distance code - 1
  (write-bits 15 4) ; HCLEN: nineteen code-length codes - 4

  (for ([symbol (in-list code-length-order)])
    (write-bits (list-ref dynamic-litonly-code-length-lengths symbol) 3))

  (for ([len (in-list dynamic-litonly-literal-lengths)])
    (write-code cl-codes len))
  (for ([len (in-list dynamic-litonly-distance-lengths)])
    (write-code cl-codes len))

  (for ([byte (in-bytes src)])
    (write-code ll-codes byte))
  (write-code ll-codes 256)
  (finish))

(define (literal-frequency-lengths input)
  (define freqs (make-vector 286 0))
  (for ([byte (in-bytes input)])
    (vector-set! freqs byte (add1 (vector-ref freqs byte))))
  (vector-set! freqs 256 (add1 (vector-ref freqs 256)))
  (vector->list (huffman-code-lengths freqs 15 #:min-codes 2)))

(define (dynamic-literal-frequency-raw-deflate input)
  (unless (bytes? input)
    (raise-argument-error 'dynamic-literal-frequency-raw-deflate "bytes?" input))
  (define ll-lengths (literal-frequency-lengths input))
  (define lcodes (trim-code-count ll-lengths 257))
  (define dist-lengths '(0))
  (define dcodes 1)
  (define combined-lengths
    (append (list-take-count ll-lengths lcodes)
            (list-take-count dist-lengths dcodes)))
  (define cl-events (code-length-rle-events combined-lengths))
  (define bl-freqs (make-vector 19 0))
  (for ([event (in-list cl-events)])
    (define symbol (cl-event-symbol event))
    (vector-set! bl-freqs symbol (add1 (vector-ref bl-freqs symbol))))
  (define bl-lengths (vector->list (huffman-code-lengths bl-freqs 7 #:min-codes 2)))
  (define blcodes
    (max 4
         (add1
          (or (for/fold ([last #f])
                         ([symbol (in-list code-length-order)]
                          [index (in-naturals)])
                (if (positive? (list-ref bl-lengths symbol)) index last))
              0))))
  (define-values (write-bits write-code finish) (make-bit-writer))
  (define bl-codes (canonical-codes bl-lengths))
  (define ll-codes (canonical-codes ll-lengths))

  ;; BFINAL=1, BTYPE=10.
  (write-bits #b101 3)
  (write-bits (- lcodes 257) 5)
  (write-bits (- dcodes 1) 5)
  (write-bits (- blcodes 4) 4)

  (for ([symbol (in-list (list-take-count code-length-order blcodes))])
    (write-bits (list-ref bl-lengths symbol) 3))

  (for ([event (in-list cl-events)])
    (write-code bl-codes (cl-event-symbol event))
    (when (positive? (cl-event-extra-bits event))
      (write-bits (cl-event-extra event) (cl-event-extra-bits event))))

  (for ([byte (in-bytes input)])
    (write-code ll-codes byte))
  (write-code ll-codes 256)
  (finish))
