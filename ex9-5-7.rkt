;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex9-5-7) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp")) #f)))
; 9.5.7.
; Define the function average-price
; It consumes a list of toy prices and computes the average price of a toy
; The average is the total of all prices divided by the number of toys

; contract
; average-price : lon -> number

; purpose
; to determine the average of a list of numbers, as defined above

; definition
(define (average-price lon)
  (cond
    [(= 0 (count lon)) (error 'average-price "Supply a non-empty list")]
    [else (/ (sum lon)
             (count lon))]))

; helper that calculates the number of items in a list
(define (count lon)
  (cond
    [(empty? lon) 0]
    [else (+ 1 (count (rest lon)))]))

; helper that calculates the sum of items in a list of numbers
(define (sum lon)
  (cond
    [(empty? lon) 0]
    [else (+ (first lon)
             (sum (rest lon)))]))

(= 5 (average-price (cons 5 empty)))
(= 3.5 (average-price (cons 6 (cons 1 empty))))
(average-price empty) ; should error out