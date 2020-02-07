;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex10-1-4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; 10.1.4
; develop convert-euro. assume 1.22 euros per dollar

; convert-euro : list-of-numbers -> list-of-numbers
; converts a list of USD amounts to a list of the corresponding Euro amounts
; (define (convert-euro list-of-usd-amounts) ...)

; we reuse the standard lon template

; example
; (define dollar-amounts (cons 2 (cons 4 (cons 1 empty))))
; (convert-euro dollar-amounts) should produce
; (cons 2.44 (cons 4.88 (cons 1.22 empty)))

; let's define the function!
(define (convert-euro list-of-usd-amounts)
  (cond
    [(empty? list-of-usd-amounts) empty]
    [else (cons
           (convert (first list-of-usd-amounts))
           (convert-euro (rest list-of-usd-amounts)))]))

; a helper to do the actual conversion
(define (convert usd-amount)
  (* 1.22 usd-amount))

; now, let's test
(define dollar-amounts (cons 2 (cons 4 (cons 1 empty))))
(convert-euro dollar-amounts) 

; 10.1.4 part 2
; generalize convert-euro to accept an exchange rate parameter

(define (convert-euro-1 list-of-usd-amounts exchange-rate)
  (cond
    [(empty? list-of-usd-amounts) empty]
    [else (cons
           (convert-1 (first list-of-usd-amounts) exchange-rate)
           (convert-euro-1 (rest list-of-usd-amounts) exchange-rate))]))

(define (convert-1 usd-amount exchange-rate)
  (* usd-amount exchange-rate))

(convert-euro-1 dollar-amounts 1.22) ; should be same as for convert-euro
(convert-euro-1 dollar-amounts 1) ; should return the same values as are in dollar-amounts