;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex7-4-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; 7.4.1

(define-struct circle (center radius))
;; (make-circle number number)

(define-struct rectangle (upper-left width height))
;; (make-rectangle posn number number)

;; a _shape_ is a circle or a rectangle

;; TEMPLATE for a shape consumer function
;; shape-consumer : shape -> ???
(define (shape-consumer a-shape)
  (cond
    [(circle? a-shape) ...]
    [(rectangle? a-shape) ...]))