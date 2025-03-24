#lang racket/gui

; 1. Care dintre urmatoarele expresii din Racket este echivalenta cu:
(let* ([x 10]
       [y (lambda () (+ x 1))])
  (y))

; Variante

; a)
((lambda (x)
     ((lambda (y) (y))) (lambda () (+ x 1))) 10)

; b)
; ((lambda (x)
;    ((lambda (y) (lambda () (+ x 1))) (y))) 10)

; c)
; ((lambda (x y) (y)) 10 (lambda () (+ x 1)))

; d)
; ((lambda (x y) 10 (lambda () (+ x 1))) (y))

; 2. Ce rezultat produce expresia Racket de mai jos?

(let* ([a 3]
       [b 2]
       [c 1]
       [f (lambda (a b) (+ a b c))])
  (let ([a 4] [b 5] [c 2])
    (f a b)))

; 3. Ce afiseaza codul Racket urmator?
(define L '(1 2 3))

(define x (cdr L))

(define y (cddr L))

(define z (cdddr L))

(let* ([x y] [y z] [z x])
  (list x y z))

; 4. Ce complexitate temporara, respectiv spatiala are urmatoarea
; implementare Racket, unde x si p sunt doua numere naturale?

(define (f x p)
  (if (= p 0)
      1
      (let* [(a (f x (quotient p 2)))
             (aa (* a a))]
        (if (= (modulo p 2) 1)
            (* aa x)
            aa))))

; Ex 1.
; R: 
((lambda (x)
   ((lambda (y) (y)) (lambda () (+ x 1))))
 10)

; Ex 2.
; R: 10
; Explicatie: domenii de vizibilitate: a - 4, b - 5, c - 1


; Ex 3.
; R: ((3) () (3))


; Ex 4.
; R: O(log p) si O(log p)