;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex6-6-6) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))
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

;; 6.6.3
;; Let's use the fun-for-circle template to develop in-circle?

;; in-circle? : circle posn -> boolean
;; to determine whether a given point is inside a given circle

;; example
;; (define inside (make-posn 100 150))
;; (define outside (make-posn 250 250))
;; (in-circle? test-circle inside) should be true
;; (in-circle? test-circle outside) should be false

;; as we define the function, we realize that we need a helper
;; to calculate the distance between two points
(define (in-circle? a-circle a-posn)
  (<= (distance (circle-center a-circle) a-posn)
     (circle-radius a-circle)))

;; ...so we define this helper
(define (distance posn-1 posn-2)
  (sqrt (+
         (sqr (- (posn-x posn-1) (posn-x posn-2)))
         (sqr (- (posn-y posn-1) (posn-y posn-2))))))

;; ...and express our examples as tests
(define inside (make-posn 100 150))
(define outside (make-posn 250 250))
(in-circle? test-circle inside)
(not (in-circle? test-circle outside))

;; 6.6.4
;; Let's use the fun-for-circle template to develop translate-a-circle

;; translate-a-circle : circle number -> circle
;; to create a circle structure that's identical to the supplied circle structure
;; except that its center is the provided amount to the right of the original's center

;; example
;; for a moving-circle defined as (make-circle (make-posn 15 150) 25 'red))
;; (translate-a-circle moving-circle 85) should produce a red circle with 25 radius
;; and a center at 100, 150

;; time to define!
(define (translate-a-circle a-circle delta)
  (make-circle
   (make-posn
    (+ (posn-x (circle-center a-circle)) delta)
    (posn-y (circle-center a-circle)))
   (circle-radius a-circle)
   (circle-color a-circle)))

;; expess example as test!
(define moving-circle (make-circle (make-posn 15 150) 25 'red))
(draw-a-circle moving-circle)
(translate-a-circle moving-circle 85) ;; note that this does NOT move the original circle on the screen!

;; 6.6.5
;; Let's use the fun-for-circle template to develop clear-a-circle

;; clear-a-circle : circle -> true
;; to clear the specified circle from the canvas

;; example
;; (define sacrificial-circle (make-posn 100 100) 50 'blue)
;; (draw-a circle sacrificial-circle) ;; circle drawn!
;; (clear-a-circle sacrificial-circle) ;; circle cleared!

;; paste template in for reference
;; fun-for-circle : circle -> ???
;(define (fun-for-circle a-circle)
;  ... (circle-center a-circle) ...
;  ... (circle-radius a-circle) ...
;  ... (circle-color a-circle) ...)

;; define function
(define (clear-a-circle a-circle)
  (clear-circle
   (circle-center a-circle)
   (circle-radius a-circle)
   (circle-color a-circle)))

;; ...and re-express example as test
(define sacrificial-circle (make-circle (make-posn 100 100) 50 'blue))
(draw-a-circle sacrificial-circle) ;; circle drawn!
(clear-a-circle sacrificial-circle) ;; circle cleared!

;; 6.6.6
;; Let's define draw-and-clear-circle

;; draw-and-clear-circle : circle -> true
;; to draw a circle, wait a little while, then clear it

(define (draw-and-clear-circle a-circle wait-time)
  (and
   (draw-a-circle a-circle)
   (sleep-for-a-while wait-time)
   (clear-a-circle a-circle)))

;; let's test it. our circle should display for 3 seconds, then be cleared
(define blink-circle (make-circle (make-posn 100 100) 20 'black))
(draw-and-clear-circle blink-circle 3)

;; now, we're ready to move our circle across the canvas!
;; move-circle : circle number -> circle
;; to draw a circle, then clear it, then translate it by the specified number of pixels
(define (move-circle delta a-circle)
  (cond
    [(draw-and-clear-circle a-circle 0.5) (translate-a-circle a-circle delta)]
    [else a-circle]))

;; compiles, so let's test!
(stop)
(start 200 100)
(define anim-circle (make-circle (make-posn 50 50) 25 'orange))
(draw-a-circle
 (move-circle 10
              (move-circle 10
                           (move-circle 10
                                        (move-circle 10 anim-circle)))))