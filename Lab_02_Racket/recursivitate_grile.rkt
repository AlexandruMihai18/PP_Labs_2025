#lang racket/gui

; 1. Pentru definitia Racket de mai jos, ce adancime maxima atinge stiva
; in timpul evaluarii expresiei (f 5)?
; Obs: daca functia ar fi recursiva pe coada, toate apelurile lui
; f s-ar afla la adancime 0, datorita tail-call optimization.
(define (f1 x)
  (cond [(< x 0) x]
        [(odd? x) (f1 (- x 1))]
        [else (+ (f1 (- x 3)) (f1 (- x 4)))]))

; R: 2
; Explicatie:
; L0 : (f 5) -> (f 4) -- tail-call optimization
; L1 :          (+ (f 1) (f 0)), (f 1) -> (f 0)
; L2 :          (+ (+ (f -3) (f -4)) (+ (f -3) (f -4))) --> -14


; 2. Tip de recursivitate? (and why?)
(define (f2 x acc)
  (if (zero? x) acc
      (f2 (sub1 x) (add1 acc))))

; R: recursivitate pe coada pentru ca nu mai realizeaza alte operatii
; dupa aplicatia recursiva


; 3. Ce calculeaza functiile? Care are recursivitate mai eficienta?

(define (f31 a b)
  (if (zero? a)
      b
      (let ((newb (+ 1 b)))
        (f31 (- a 1) newb))))

(define (f32 a b)
  (if (zero? a)
      b
      (let ((newf (f32 (- a 1) b)))
        (+ 1 newf))))

; R: f31 si f32 calculeaza acelasi rezultat, dar f1 are o recursivitate
; mai eficienta decat f2


; 4. Cum arata procesul generat de apelul (par? 10) in Racket?
(define (par? x)
  (or (zero? x)
      (impar? (- x 1))))

(define (impar? x)
  (and (> x 0)
       (par? (- x 1))))

; R: Ca o iteratie - nu este necesara depunerea de informatii pe stiva.


; 5. Ce fel de recursivitate utilizeaza functia?
(define (subsets set set-size subset-size current-set result)
  (cond [(zero? subset-size)
         (cons (reverse current-set) result)]
        [(> subset-size set-size) result]
        [else (subsets (cdr set)
                       (sub1 set-size)
                       (sub1 subset-size)
                       (cons (car set) current-set)
                       (subsets (cdr set)
                                (sub1 set-size)
                                subset-size
                                current-set
                                result))]))

; R: recursivitate pe stiva (pentru a evalua subsets de la linia 63,
; avem nevoie de a evalua intai functia subsets la linia 67.


; 6. Ce afiseaza codul Racket urmator?
(define (f L)
  (if (or (null? (cdr L)) (null? L))
      1
      (+ 1 (f (cddr L)))))

(f '(1))
(f '(1 2 3 4 5 6 7 8))

; R: 1 si eroare (pentru al doilea apel se va ajunge la (f '())
; care va genera eroare la evaluarea (null? (cdr L))
