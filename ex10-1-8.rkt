;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex10-1-8) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; 10.1.8
; Develop quadratic-roots

; quadratic-roots : number number number -> 'degenerate OR 'none OR number (the one solution) OR list of two numbers
; to compute the solution(s) of a quadratic equation, if there are any
; (define (quadratic-roots a b c) ...)

; let's skip the goddamn template step and define the function
(define (quadratic-roots a b c)
  (cond
    [(= a 0) 'degenerate]
    [(= (how-many a b c) 0) 'none]
    [(= (how-many a b c) 1) (/ (* -1 b) (* 2 a))]
    [(= (how-many a b c) 2) (cons (/ (+ (* -1 b) (sqrt (discriminant a b c)))
                                     (* 2 a))
                                  (cons
                                   (/ (- (* -1 b) (sqrt (discriminant a b c)))
                                      (* 2 a))
                                   empty))]))


; helper that figures out how many solutions the quadratic function has
; based on the values of its coefficients
(define (how-many a b c)
  (cond
    [(< (discriminant a b c) 0) 0]
    [(= (discriminant a b c) 0) 1]
    [(> (discriminant a b c) 0) 2]))

; helper that calculates the discriminant of a quadratic
; based on its coefficients
(define (discriminant a b c)
  (- (* b b)
     (* 4 a c)))

; tests
; for 2x^2 + 4x + 2 = 0, there should be one solution: -1
; for x^2 - 1 = 0, there should be 2 solutions: -1 and 1

(quadratic-roots 2 4 2)
(quadratic-roots 1 0 -1)
(quadratic-roots 0 1 1)
(quadratic-roots 2 4 3)
(quadratic-roots 3 4 1)