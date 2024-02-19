#lang racket

; NAME BINDING - LEGARE
; -> procedeul prin care se asociaza unui identificator o valoare
; 1. DINAMICA - toti identificatorii si valorile variabilelor sunt puse
; intr-un context global
; 2. STATICA - se creeaza un nou context pentru identificatori si valori

; Legare STATICA - let
; Legare DINAMICA - define

; Sintaxa let, let*, letrec
; (let ((id1 val1) (id2 val2) ...)
;      ( expresii cu id1, id2, ...))

; LET - domeniul de vizibilitate in corpul functiilor care urmeaza
; (excluzand alte legari in let)

(define a 10)

(let ((a 1) (b (+ a 1))) ; b nu este influentat de legarea lui a la 1
  (cons a b))

(let ((x 1))
  (let ((f (lambda () (print x))))
    (let ((x 2))
      (f))))

(display "\n")

; LET* - domeniul de vizibilitate in corpul functiilor care urmeaza
; (incluzand alte legari care urmeaza in let*)

(let* ((a 1) (b (+ a 1)))
  (cons a b))

; LETREC - domeniul de vizibilitate in corpul functiilor care urmeaza
; (incluzand legarile care au existat si care urmeaza in letrec)
; - util pentru apeluri recursive imbricate

;(letrec ((u v) (v 1))
; (cons u v))

; eroare - nu se cunoaste valoarea lui v la momentul definirii lui u

(letrec
    ((even-length?
      (lambda (L)
        (if (null? L)
            #t
            (odd-length? (cdr L)))))
     (odd-length?
      (lambda (L)
        (if (null? L)
            #f
            (even-length? (cdr L))))))
  (even-length? '(1 2 3 4 5 6)))

; NAMED LET - mod de a itera in interiorul unei functii
; (let auxiliary_func_name ((id1 val1) (id2 val2) ...)
;      (expresii cu id1, id2, ... implementat recursiv utilizand functia auxiliara))

(define (interval a b step)
  (let iter ((b b) (result '()))
    (if (> a b)
        result
        (iter (- b step) (cons b result)))))