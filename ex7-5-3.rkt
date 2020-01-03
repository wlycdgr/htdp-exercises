;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex7-5-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct vec (x y))

(define (positive-number? v)
  (and (number? v) (> v 0)))

;; checked-make-vec : Scheme-value Scheme-value -> vec
;; to make a vec provided the two supplied Scheme-value values
;; are positive numbers
;; returns an error otherwise
(define (checked-make-vec v1 v2)
  (cond
    [(and (positive-number? v1) (positive-number? v2))
     (make-vec v1 v2)]
    [else
     (error 'checked-make-vec "two positive numbers expected")]))

;; (checked-make-vec -1 2) error!
;; (checked-make-vec 2 -1) error!
;; (checked-make-vec -3 -4) error!
(vec? (checked-make-vec 3 4))
(= 3 (vec-x (checked-make-vec 3 4)))
(= 4 (vec-y (checked-make-vec 3 4)))
