;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex4-4-4) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp")) #f)))
;; data analysis
;; there are 3 distinct possibilities that we have to check for
;; b^2 > 4 * a * c
;; b^2 = 4 * a * c
;; and b^2 < 4 * a *c

;; examples
;; a b c = 1 0 1 => 0^2 < 4 * 1 * 1 => 0 solutions
;; a b c = 1 1 1 => 1^2 < 4 * 1 * 1 => 0 solutions
;; a b c = 5 5 5 => 5^2 < 4 * 5 * 5 => 0 solutions
;; a b c = 10 1 0 => 1^2 > 4 * 10 * 0 => 2 solutions
;; a b c = 1 2 1 => 2^2 = 4 * 1 * 1 => 1 solution

;; how-many : number number number -> number
;; to determine how many distinct real solutions a proper quadratic equation has
;; given the values of its coefficients
;(define (how-many a b c)
;  (cond
;    [(> (sqr b) (* 4 a c)) 2]
;    [(= (sqr b) (* 4 a c)) 1]
;    [else 0]))


;; how would the function change if we didn't assume
;; the equation was proper?
;; ....it wouldn't? I don't get it

;; a better-decomposed way to implement this:
(define (how-many a b c)
  (cond
    [(> (discriminant a b c) 0) 2]
    [(= (discriminant a b c) 0) 1]
    [else 0]))

;; discriminant : number number number -> number
;; to determine the value of a a quadratic function's discriminant
;; given its coefficients
(define (discriminant a b c)
  (- (sqr b) (* 4 a c)))

;; examples as tests
(= (how-many 1 0 1) 0)
(= (how-many 1 1 1) 0)
(= (how-many 5 5 5) 0)
(= (how-many 10 1 0) 2)
(= (how-many 1 2 1) 1)