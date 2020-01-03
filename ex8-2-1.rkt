;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex8-2-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; LEGAL EXPRESSIONS
;; 1. x
;; it is a bare variable, which is a valid expression in the Scheme grammar

;; 2. (= y z)
;; it is an application of a primitive to two expressions (which happen to each be variables), which is a valid expression
;; in the Scheme grammar

;; 3. (= (= y z) 0)
;; it is an application of a primitive to two expressions, one of which is a constant (a valid expression in the Scheme grammar)
;; and the other of which is of the form of #2 (again valid, see above). The overall structure is the same as for #2,
;; which is valid, so this is also valid.

;; ILLEGAL EXPRESSIONS
;; 1. (3 + 4)
;; Infix operator primitives are not valid in Scheme. The primitive must be the first thing after the left parenthesis

;; 2. empty?(1)
;; A valid Scheme function application must begin with a left parenthesis.

;; 3. (x)
;; A set of parentheses must contain a primitive application, a function application, or a cond expression.
;; It cannot contain a bare variable