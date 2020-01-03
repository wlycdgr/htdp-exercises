;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex8-6-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define RADIUS 10)
(define DIAMETER (* 2 RADIUS))
; DIAMETER = 20
(define CIRCUMFERENCE (* 3.14 DIAMETER))
; CIRCUMFERENCE = 20 * 3.14 = 62.8