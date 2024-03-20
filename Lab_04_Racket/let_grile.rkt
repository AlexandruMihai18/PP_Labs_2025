#lang racket/gui

; 1. Care dintre urmatoarele expresii din Racket este echivalenta cu:
(let* ([x 10]
       [y (lambda () (+ x 1))])
  (y))

; R: 
((lambda (x)
   ((lambda (y) (y)) (lambda () (+ x 1))))
 10)


; 2. Ce rezultat produce expresia Racket de mai jos?

(let* ([a 3]
       [b 2]
       [c 1]
       [f (lambda (a b) (+ a b c))])
  (let ([a 4] [b 5] [c 2])
    (f a b)))

; R: 10
; Explicatie: domenii de vizibilitate: a - 4, b - 5, c - 1


; 3. Ce afiseaza codul Racket urmator?
(define L '(1 2 3))

(define x (cdr L))

(define y (cddr L))

(define z (cdddr L))

(let* ([x y] [y z] [z x])
  (list x y z))

; R: ((3) () (3))