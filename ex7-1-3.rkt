;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex7-1-3) (read-case-sensitive #t) (teachpacks ((lib "hangman.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "hangman.rkt" "teachpack" "htdp")) #f)))
;; 7.1.2

(define PI 3.14)

(define-struct circle (center radius))
(define-struct square (ul side))

(define (square-perimeter a-square)
  (* 4 (square-side a-square)))

(define (circumference a-circle)
  (* 2 PI (circle-radius a-circle)))

(define (perimeter a-shape)
  (cond
    [(circle? a-shape) (circumference a-shape)]
    [(square? a-shape) (square-perimeter a-shape)]))

(= 12
   (perimeter (make-square (make-posn 20 20) 3)))

(= 12
   (perimeter (make-square (make-posn 2 20) 3)))

(= 6.28
   (perimeter (make-circle (make-posn 10 99) 1)))

;; 7.1.3
;; area : shape -> number
;; to compute the area of a shape
;; a shape is either a circle or a square

(define (circle-area a-circle)
  (* PI (sqr (circle-radius a-circle))))

(define (square-area a-square)
  (sqr (square-side a-square)))

(define (area a-shape)
  (cond
    [(circle? a-shape) (circle-area a-shape)]
    [(square? a-shape) (square-area a-shape)]))

(= 9
   (area (make-square (make-posn 10 50) 3)))

(= (* 4 PI)
   (area (make-circle (make-posn 1 35) 2)))