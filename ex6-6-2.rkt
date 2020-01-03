;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex6-6-2) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))
;; 6.6.1

(define-struct circle (center radius color))
;; a circle is a structure:
;;    (make-circle center radius color)
;; where center is a posn describing the center of the circle,
;;radius is a number decribiing the radius of the circle
;; and color is a symbol

;; fun-for-circle : circle -> ???
;(define (fun-for-circle a-circle)
;  ... (circle-center a-circle) ...
;  ... (circle-radius a-circle) ...
;  ... (circle-color a-circle) ...)

;; 6.6.2
;; let's use the fun-for-circle template to develop draw-a-circle.

;; draw-a-circle : circle -> true; has effect of drawing circle on screen
;; to draw the given circle on the screen

(define (draw-a-circle a-circle)
  (draw-circle
   (circle-center a-circle)
   (circle-radius a-circle)
   (circle-color a-circle)))

(start 300 300)
(define test-circle (make-circle (make-posn 150 150) 100 'orange))
(draw-a-circle test-circle)