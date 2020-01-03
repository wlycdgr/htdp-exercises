;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex7-3-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; 7.3.1

(define PI 3.14)

;; undecomposed variant:

(define-struct circle (center radius))
(define-struct square (top-left side))
(define-struct rectangle (top-left width height))
;; A shape is either a circle, a square, or a rectangle

;; perimeter : shape -> number
;; to computer the perimeter of a specified shape
(define (perimeter a-shape)
  (cond
    [(circle? a-shape)
     (* 2 PI (circle-radius a-shape))]
    [(square? a-shape)
     (* 4 (square-side a-shape))]
    [(rectangle? a-shape)
     (+ (* 2 (rectangle-width a-shape))
        (* 2 (rectangle-height a-shape)))]))


;; decomposed variant:
(define (perimeter-decomposed a-shape)
  (cond
    [(circle? a-shape) (circumference a-shape)]
    [(square? a-shape) (perimeter-square a-shape)]
    [(rectangle? a-shape) (perimeter-rectangle a-shape)]))

(define (circumference a-circle)
  (* 2 PI (circle-radius a-circle)))

(define (perimeter-square a-square)
  (* 4 (square-side a-square)))

(define (perimeter-rectangle a-rectangle)
  (+ (* 2 (rectangle-width a-rectangle))
     (* 2 (rectangle-height a-rectangle))))