;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex6-6-9) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))
;; 6.6.7

(define-struct rectangle (ul w h c))
;; a rectangle is a structure:
;;    (make-rectangle ul w h c)
;; where ul is a posn that represents the rectangle's upper left corner
;; w and h are numbers that represent the width and height of the rectangle,
;; and c is a color

;; let's develop a Template
;; fun-for-rect : rectangle -> ???
;(define (fun-for-rect a-rectangle)
;  ... (rectangle-ul a-rectangle) ...
;  ... (rectangle-w a-rectangle) ...
;  ... (rectangle-h a-rectangle) ...
;  ... (rectangle-c a-rectangle) ...)

;; 6.6.8
;; let's use the template to develop draw-a-rectangle

;; draw-a-rectangle : rectangle -> true
;; draws the provided rectangle structure

(define (draw-a-rectangle a-rectangle)
  (draw-solid-rect
   (rectangle-ul a-rectangle)
   (rectangle-w a-rectangle)
   (rectangle-h a-rectangle)
   (rectangle-c a-rectangle)))

;; and let's test it
(start 300 300)
(define example-rect-1 (make-rectangle (make-posn 100 100) 100 25 'orange))
(draw-a-rectangle example-rect-1)

;; 6.6.9
;; let's use the template to develop in-rectangle?

;; in-rectangle? : rectangle posn -> boolean
;; determines whether a given point is inside a given rectangle
;; in the process, we realize we can use a helper to tell us whether a value
;; is between two other values
(define (in-rectangle? a-rectangle a-posn)
  (and
   (between-inclusive 0 (rectangle-w a-rectangle)
               (- (posn-x a-posn) (posn-x (rectangle-ul a-rectangle))))
   (between-inclusive 0 (rectangle-h a-rectangle)
               (- (posn-y a-posn) (posn-y (rectangle-ul a-rectangle))))))

;; ...so we define the helper
;; between-inclusive : number number number -> boolean
;; between-inclusive : lower-bound upper-bound value -> boolean
;; to determine whether value is between lower-bound and upper-bound, inclusived

;; example
;; (between-inclusive 1 5 0) -> false
;; (between-inclusive 1 5 1) -> true
;; (between-inclusive 1 5 4) -> true
;; (between-inclusive 1 5 5) -> true
;; (between-inclusive 1 5 6) -> false

(define (between-inclusive lower-bound upper-bound value)
  (and (<= lower-bound value)
       (>= upper-bound value)))

;; express examples as tests
(not (between-inclusive 1 5 0))
(between-inclusive 1 5 1)
(between-inclusive 1 5 4)
(between-inclusive 1 5 5)
(not (between-inclusive 1 5 6))

;; as for the main in-rectangle? function, we would test
;; the following distinct scenarios:
;; point is above and to left -> false
;; point is above -> false
;; point is above and to right -> false
;; point is to right -> false
;; point is below and to right -> false
;; point is below -> false
;; point is below and to left -> false
;; point is to left -> false
;; point is on left edge -> true
;; point is on top edge -> true
;; point is on right edge -> true
;; point is on bottom edge -> true
;; point is in top left corner -> true
;; point is in top right corner -> true
;; point is in bottom right corner -> true
;; point is in bottom left corner -> true
;; point is inside -> true

;; however, that is insane, so let's just do the minimum:
;; point outside -> false
;; point on border -> true
;; point inside border -> true
(define example-rect-2 (make-rectangle (make-posn 100 100) 100 50 'black))
(define outside (make-posn 250 125))
(define on-border (make-posn 170 100))
(define inside (make-posn 130 140))

(not (in-rectangle? example-rect-2 outside))
(in-rectangle? example-rect-2 on-border)
(in-rectangle? example-rect-2 inside)