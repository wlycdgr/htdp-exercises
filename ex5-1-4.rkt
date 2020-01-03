;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex5-1-4) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
;; what-kind : number number number -> symbol
;; to determine whether a quadratic function is proper
;; and how many distinct real solutions it has if so,
;; given its coefficients

;; data analysis
;; there are 4 distinct cases
;; a = 0 -> function is degenerate
;; and the three cases when a != 0:
;; b^2 > 4ac -> 2 distinct real solutions
;; b^2 = 4ac -> 1 distinct real solution
;; b^2 < 4ac -> no distinct real solutions
;; so, we need a conditional expression with 4 conditional clauses

;; examples
;; 1 1 1 -> no solutions
;; 0 1 1 -> degenerate
;; 1 8 1 -> 2 solutions
;; 1 2 1 -> 1 solution
;; 1 -2 1 -> 1 solution
;; 1 -8 1 -> 2 solutions
;; -4 0 2 -> 2 solutions
;; 3 -2 -5 -> 2 solutions

;; structural definition
;(define (what-kind a b c)
;  (cond
;    [... ...]
;    [... ...]
;    [... ...]
;    [... ...]))

;; flesh out the conditions
;; as we do, we realize we need a helper (discriminant)
;(define (what-kind a b c)
;  (cond
;    [(= a 0) ...]
;    [(> (discriminant a b c) 0) ...]
;    [(= (discriminant a b c) 0) ...]
;    [(< (discriminant a b c) 0) ...]))

;; ...so we define the helper
;; discriminant : number number number -> number
;; to find the discriminant of a proper quadratic function given its coefficients
(define (discriminant a b c)
  (- (sqr b) (* 4 a c)))

;; ..and finally, flesh out the what-kind definition with the answers
(define (what-kind a b c)
  (cond
    [(= a 0) 'degenerate]
    [(> (discriminant a b c) 0) 'two]
    [(= (discriminant a b c) 0) 'one]
    [(< (discriminant a b c) 0) 'none]))

;; having confirmed that the definition
;; is syntactically correct, re-express our examples as tests
(symbol=? (what-kind 1 1 1) 'none)
(symbol=? (what-kind 0 1 1) 'degenerate)
(symbol=? (what-kind 1 8 1) 'two)
(symbol=? (what-kind 1 2 1) 'one)
(symbol=? (what-kind 1 -2 1) 'one)
(symbol=? (what-kind 1 -8 1) 'two)
(symbol=? (what-kind -4 0 2) 'two)
(symbol=? (what-kind 3 -2 -5) 'two)