;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex7-4-5) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))
;; 7.4.1

(define-struct circle (center radius color))
;; (make-circle number number symbol)

(define-struct rect (upper-left width height color))
;; (make-rect posn number number symbol)

;; a _shape_ is a circle or a rect

;; TEMPLATE for a shape consumer function
;; shape-consumer : shape -> ???
(define (shape-consumer a-shape)
  (cond
    [(circle? a-shape) ...]
    [(rect? a-shape) ...]))

;; 7.4.2
(define (draw-a-circle a-circle)
  (draw-circle
   (circle-center a-circle)
   (circle-radius a-circle)
   (circle-color a-circle)))

(define (draw-a-rect a-rect)
  (draw-solid-rect
   (rect-upper-left a-rect)
   (rect-width a-rect)
   (rect-height a-rect)
   (rect-color a-rect)))

(define (draw-shape a-shape)
  (cond
    [(circle? a-shape) (draw-a-circle a-shape)]
    [(rect? a-shape) (draw-a-rect a-shape)]))

;; 7.4.3
(define (shift-posn a-posn x-delta y-delta)
  (make-posn
   (+ x-delta (posn-x a-posn))
   (+ y-delta (posn-y a-posn))))

(define (translate-circle a-circle delta)
  (make-circle
   (shift-posn (circle-center a-circle) delta 0)
   (circle-radius a-circle)
   (circle-color a-circle)))

(define (translate-rect a-rect delta)
  (make-rect
   (shift-posn (rect-upper-left a-rect) delta 0)
   (rect-width a-rect)
   (rect-height a-rect)
   (rect-color a-rect)))

(define (translate-shape a-shape delta)
  (cond
    [(circle? a-shape) (translate-circle a-shape delta)]
    [(rect? a-shape) (translate-rect a-shape delta)]))

;; 7.4.4
(define (clear-a-circle a-circle)
  (clear-circle
   (circle-center a-circle)
   (circle-radius a-circle)
   (circle-color a-circle)))

(define (clear-a-rect a-rect)
  (clear-solid-rect
   (rect-upper-left a-rect)
   (rect-width a-rect)
   (rect-height a-rect)
   (rect-color a-rect)))

(define (clear-shape a-shape)
  (cond
    [(circle? a-shape) (clear-a-circle a-shape)]
    [(rect? a-shape) (clear-a-rect a-shape)]))

;; 7.4.5
(define (draw-and-clear-circle a-circle)
  (and
   (draw-a-circle a-circle)
   (sleep-for-a-while 1)
   (clear-a-circle a-circle)))

(define (draw-and-clear-rect a-rect)
  (and
   (draw-a-rect a-rect)
   (sleep-for-a-while 1)
   (clear-a-rect a-rect)))

(define (draw-and-clear-shape a-shape)
  (cond
    [(circle? a-shape) (draw-and-clear-circle a-shape)]
    [(rect? a-shape) (draw-and-clear-rect a-shape)]))