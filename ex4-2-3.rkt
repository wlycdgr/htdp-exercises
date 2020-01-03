;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex4-2-3) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp")) #f)))
;; 1
;; equation1 : number -> boolean
;; to determine whether a number is a solution to 4 * n + 2 = 62
(define (equation1 n)
  (= 62
     (+ (* 4 n) 2)))

;(equation1 15) "should be" true
;(equation1 10) "should be" false
;(equation1 12) "should be" false
;(equation1 14) "should be" false


;; 2
;; equation2 : number -> boolean
;; to determine whether a number is a solution to 2 * n^2 = 102
(define (equation2 n)
  (= 102
     (* (* n n) 2)))

;(equation2 10) "should be" false
;(equation2 12) "should be" false
;(equation2 14) "should be" false
; (equation2 (sqrt 51)) "should be" true  ; does not return true! rounding?


;; 3
;; equation3 : number -> boolean
;; to determine whether a number is a solution to 4 * n^2 + 6 * n + 2 = 462
(define (equation3 n)
  (= 462
     (+ (* 4 (* n n))
        (* 6 n)
        2)))

;(equation3 10) "should be" true
;(equation3 12) "should be" false
;(equation3 14) "should be" false
