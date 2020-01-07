;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex9-5-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; 9.5.2
; develop how-many-symbols

; contract
; how-many-symbols : los -> number

; purpose
; to count the number of items in a list of symbols

; examples
; (how-many-symbols empty) should be 0
; (how-many-symbols (cons 'boop empty)) should be 1
; (how-many-symbols (cons 'doll (cons 'truck empty)) should be 2

; template for a list-of-symbols consumer
; (define (los-consumer los)
;    (cond
;        [(empty? los) ...]
;        [else (... (first los) ... (los-consumer (rest los)) ...]))


; definition
(define (how-many-symbols los)
  (cond
    [(empty? los) 0]
    [else (+ 1 (how-many-symbols (rest los)))]))

; tests
(= 0 (how-many-symbols empty))
(= 1 (how-many-symbols (cons 'boop empty)))
(= 2 (how-many-symbols (cons 'doll (cons 'truck empty))))

; part 2
; develop how-many-numbers

; contract
; how-many-numbers : lon -> number

; purpose
; to count the number of items in a list of numbers

; examples
; (how-many-numbers empty) should be 0
; .....

; definition
(define (how-many-numbers lon)
  (cond
    [(empty? lon) 0]
    [else (+ 1 (how-many-numbers (rest lon)))]))

(= 0 (how-many-numbers empty))
(= 1 (how-many-numbers (cons 2 empty)))
(= 2 (how-many-numbers (cons 4 (cons 32 empty))))

; they differ only in the type of input they accept:
; list of numbers vs list of symbols