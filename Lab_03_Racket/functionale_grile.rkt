#lang racket/gui

; 1. Care dintre functionalele map, foldl, foldr, apply poate inlocui
; semnul intrebarii in expresia Racket de mai jos astfel incat aceasta
; sa se evalueze la ’((1))?

; (? (lambda (x y) (y x)) (list 1) (list list))

; 2. Care este valoare expresiei Racket de mai jos?
((foldr compose
        (lambda (x) x)
        (list (curry + 1) (curry * 2)))
 5)

; 3. Ce calculeaza urmatoarea expresie in Racket?
(define mat '((1 2) (3 4)))
(apply + (apply append mat))

; 4. Ce produce codul Racket urmator?
(define (foo f)
  (foldl f 1 '(1 2)))

(define (bar f)
  (foldr f 1 '(1 2)))

(filter (lambda (f) (equal? (foo f) (bar f)))
        (list + - * list))

; 5. Ce rezultat produce codul Racket urmator?
(define (f a)
  (lambda (b)
    (lambda (g)
      (g b a))))
(map ((f '()) '()) (list cons append list))

; 6. In evaluare apelui Racket functia list este apelata de ... ori.
(apply map (cons list '((1 2 3) (a b c))))


; Ex 1.
; R: map si apply
; (map (lambda (x y) (y x)) (list 1) (list list))
; (foldr (lambda (x y) (y x)) (list 1) (list list))
; (foldr (lambda (x y) (y x)) (list 1) (list list))
; (apply (lambda (x y) (y x)) (list 1) (list list))

; Ex. 2
; R: 11
; Explicatie: ((λ (x) (+ x 1) . λ (x) (+ x 2) . λ (x) (x)) 5)
; (1 + (2 * 5)) = 11

; Ex. 3 
; R: Suma numerelor din matrice
; Explicatie:
; (apply append mat) -> creeaza lista elementelor din matrice
; (apply + lista) -> suma elementelor din matrice

; Ex. 4
; R: (#<procedure:+> #<procedure:*>)
; Explicatie: filtreaza functiile care determina acelasi rezultat
; in urma aplicarii foldr si foldl din foo, respectiv bar
; + si * sunt singurele care respecta

; Ex. 5
; R: ((()) () (() ()))
; Explicatie: se obtine o lista care contine rezultatele urmatoarelor
; apeluri:
; cons '() '() -> '(())
; append '() '() -> '()
; list '() '() -> '(() ())

; Ex. 6
; R: 3 ori
; Explicatie: (apply map '(list (1 2 3) (a b c)))
; -> (map list '(1 2 3) '(a b c))
; -> '((1 a) (2 b) (3 c))






