;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex8-2-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; LEGAL DEFINITIONS
;; 1. (define (f x) x)
;; Definitions must begin with a left parenthesis, this does
;; Definitions must next have the keyword define, this does
;; Definitions must then have a non-empty sequence of variables in parentheses, this does
;; Definitions must then have an expression, this does
;; Finally, defs must end with a right parenthesis that closes the very first left one. This does.

;; 2. (define (f x) y)
;; This is valid for the same reasons as #1

;; 3. (define (f x y) 3)
;; This is again valid for the same reasons as #1
;; We just have to recognize that a constant is a valid expression as well as the variable we have in #1
;; And that there may be an arbitrary number of variables inside the parentheses after define so long as there is at least two

;; ILLEGAL DEFINITIONS
;; 1. (define (f 'x) x)
;; Eact item in the parentheses after the define must be a variable, but 'x is a symbol, which is a constant - not a variable

;; 2. (define (f x y z) (x))
;; The expressions that immediately precedes the final right parenthesis must not itself be enclosed in parentheses

;; 3. (define (f) 10)
;; There must be at least two variables in the parentheses after the define