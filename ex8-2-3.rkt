;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex8-2-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; 8.2.3
;; 1. (x)
;; Illegal.
;; If the opening left parenthesis of an expression is followed by a variable, as here,
;; there must be at least one expression that follows the variable before the closing right parenthesis

;; 2. (+ 1 (not x))
;; Legal.
;; A primitive may follow the opening left parenthesis of an expression
;; In this case, at least one valid expression must follow the primitive. Here, two expressions follow the primitive.
;; 1 is a valid expression because a bare constant is a valid expression
;; (not x) is a valid expression because it consists of a left parenthesis followed by a primitive followed by a valid expression followed by a right parenthesis
;; So, the two expressions that follow the primitive are both valid
;; There must be a closing right parenthesis at the end, and there is one here

;; 3. (+ 1 2 3)
;; Legal.
;; A primitive may follow the opening left par
;; 1+ valid expressions must follow; there may be arbitrarily many
;; Here, there are three, all constants, and all therefore valid expressions
;; The required closing right par is present

;; ^ CORRECT