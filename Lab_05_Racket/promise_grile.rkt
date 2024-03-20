#lang racket/gui

; 1. De cate ori se calculeaza corpul functiei calcul la evaluare expresiei
; Racket de mai jos?

(define (calcul x) (x))

(stream-first (stream-cons (calcul 0)
                           (stream-cons (calcul 1)
                                        empty-stream)))

; R: O singura data -> streamuri -- lazy evaluation


; 2. Ce rezultat produce fortarea promisiunii promise in Racket?
(define promise
  (let ([y1 1])
    (delay (+ x1 y1))))

(define x1 20)

(define y1 2)

(force promise)

; R: 21 -- domenii de vizibilitate, promisiunea a fost definita inaintea
; variabilelor x si y


; 3. Ce afiseaza (prin display si valoare de retur) codul Racket urmator?
(define x (delay ((lambda (x) (display x) (+ x x)) 5)))

(define y (delay ((lambda (x) (display x) (+ x x)) 5)))

(define z x)

(* (force x) (force y) (force z))

; R: 551000
; 5 - (force x) -> x devine 10
; 5 - (force y) -> y devine 10
; 1000 - rezultatul operatiei


