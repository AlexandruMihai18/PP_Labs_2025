#lang racket

; RECURSIVITATE PE STIVA
; - ineficienta dpdv al memoriei
; - erori de tip stack overflow
; - timpul necesar redimensionarii stivei ar putea fi folosit pentru
; alte calcule

(define (stack-factorial n)
  (if (= n 0)
      1
      (* n (stack-factorial (- n 1)))))

; RECURSIVITATE PE COADA
; - apare tail call optimization
; - spatiul pe stiva de apeluri este constant
; - varianta mai buna dintre cele 2 tipuri de recursivitate
; - se utilizeaza acc (un acumulator) insa prezenta lui in antetul
; functiei NU este un factor definitoriu pentru a clasifica functia
; ca avand recursivitate pe coada (trebuie sa ne uitam la corpul functiei)

(define (tail-recursion n acc)
  (if (= n 0)
      acc
      (tail-recursion (- n 1) (* n acc))))

(define (tail-factorial n)
  (tail-recursion n 1))

; RECURSIVITATE ARBORESCENTA
; - cel putin 2 apeluri recursive ale functiei in acelasi expresie
; - ineficient dpdv al memoriei, pot aparea apeluri duplicate

(define (fibo n)
  (cond
    ((= n 0) 0)
    ((= n 1) 1)
    (else (+ (fibo (- n 1)) (fibo (- n 2))))))