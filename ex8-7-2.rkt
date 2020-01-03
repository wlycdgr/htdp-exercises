;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex8-7-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; 8.7.2. which are values?

; 1.
; (make-point 1 2 3)
; this is a value. structs are values.
; CORRECT
; but, it's because 1, 2, and 3 are values

; 2.
; (make-point (make-point 1 2 3) 4 5)
; this is a value. structs are values, and the struct constructor can accept a struct as one of the variables
; CORRECT

; 3.
; (make-point (+ 1 2) 3 4)
; this is a value.
; INCORRECT
; this is NOT a value
; because (+ 1 2) is not a value
; it HAS a value, though: (make-point 3 3 4)


; what is a value?
; a value is a program that CANNOT BE SIMPLIFIED BY HAND-EVALUATION