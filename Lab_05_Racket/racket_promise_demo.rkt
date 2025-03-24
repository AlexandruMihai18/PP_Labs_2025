#lang racket

; EVALUARE APLICATIVA vs EVALUARE LENESA

; EVALUARE APLICATIVA - EAGER EVALUATION - expresia este evaluata imediat ce
; o variabila se leaga la aceasta
; - specific limbajului Racket

; EVALUARE LENESA - LAZY EVALUATION - se intarzie evaluarea unei expresii
; pana cand valoarea ei este necesara
; - specific limbajului Haskell
; - exista mecanisme prin care se poate intarzia evaluarea unei expresii

; 1. Evaluare lenesa folosind inchideri functionale
(define sum1
  (lambda (x y)
    (lambda ()
      (+ x y))))

(define sum2
  (lambda (x)
    (lambda (y)
      (lambda ()
        (+ x y)))))

; 2. Evaluare lenesa folosind promisiuni

(define sum3
  (lambda (x y)
    (delay (+ x y))))

; Streams - aplicatii ale evaluarii lenese

; stream-cons - cons pentru streams
; stream-first - car pentru streams
; stream-rest - cdr pentru streams
; empty-stream - omologul lui '(), fluxul vid
; stream-empty? - null? pentru streams
; stream-map - map, dar accepta doar functii unare
; stream-filter

; STREAM CU 1
(define ones-stream
  (stream-cons 1 ones-stream))

(define (stream-take s n)
  (cond [(zero? n) '()]
        [(stream-empty? s) '()]
        [else (cons (stream-first s)
                    (stream-take (stream-rest s) (- n 1)))]))

(stream-take ones-stream 5)

; STREAMUL NUMERELOR NATURALE

(define (make-naturals k)
  (stream-cons k (make-naturals (add1 k))))

(define naturals-stream (make-naturals 0))

(stream-take naturals-stream 5)

; STREAMUL CU NUMERE FIBONACCI

(define (make-fibo k1 k2)
  (stream-cons k1 (make-fibo k2 (+ k1 k2))))

(define fibo1-stream (make-fibo 0 1))

(stream-take fibo1-stream 10)

; Cum facem primes-stream?

(define sieve
  (lambda (s)
    (let [(divisor (stream-first s))]
      (stream-cons divisor
                 (sieve (stream-filter (λ(n) (< 0 (modulo n divisor))) (stream-rest s)))))))

(define primes-stream
  (sieve
   (stream-rest (stream-rest naturals-stream))))

(stream-take primes-stream 5)