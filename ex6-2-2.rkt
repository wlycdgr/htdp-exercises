;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex6-2-2) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))
;; dimensions of traffic light
(define WIDTH 50)
(define HEIGHT 160)
(define BULB-RADIUS 20)
(define BULB-DISTANCE 10)

;; the positions of the bulbs
(define X-BULBS (quotient WIDTH 2))
(define Y-RED (+ BULB-DISTANCE BULB-RADIUS))
(define Y-YELLOW (+ Y-RED BULB-DISTANCE (* 2 BULB-RADIUS)))
(define Y-GREEN (+ Y-YELLOW BULB-DISTANCE (* 2 BULB-RADIUS)))

;; draw the light with the red bulb turned on
(start WIDTH HEIGHT)
(draw-solid-disk (make-posn X-BULBS Y-RED) BULB-RADIUS 'red)
(draw-circle (make-posn X-BULBS Y-YELLOW) BULB-RADIUS 'yellow)
(draw-circle (make-posn X-BULBS Y-GREEN) BULB-RADIUS 'green)

;; we start with the above
;; now, we need to develop a function called clear-bulb
;; it consumes a symbol that denotes one of the possible colors
;; and it produces true
;; its effect is to 'turn off' the matching bulb in the traffic light

;; clear-bulb : symbol -> boolean
;; to 'turn off' the bulb in the traffic light that corresponds to the color passed in

;; data analysis
;; we have four distinct possibilities we need to handle
;; red, yellow, green, and [other]
;; red -> turn off the red bulb, return true
;; yellow -> turn off the yellow bulb, return true
;; green -> turn off the green bulb, return true
;; [other] -> just return true
;; we need a conditional expression with 4 condition clauses

;; examples
;; see above

;; let's sketch out the structure of the definition
;(define (clear-bulb color)
;  (cond
;    [... ...]
;    [... ...]
;    [... ...]
;    [... ...]))

;; now let's pop in the conditions
;(define (clear-bulb color)
;  (cond
;    [(symbol=? color 'red) ...]
;    [(symbol=? color 'yellow) ...]
;    [(symbol=? color 'green) ...]
;    [else ...]))

;; ...aaaand add the answers
;; we realize we need a helper
(define (clear-bulb color)
  (cond
    [(symbol=? color 'red) (and (disk-to-circle Y-RED 'red) true)]
    [(symbol=? color 'yellow) (and (disk-to-circle Y-YELLOW 'yellow) true)]
    [(symbol=? color 'green) (and (disk-to-circle Y-GREEN 'green) true)]
    [else true]))

;; ...so let's define the helper
(define (disk-to-circle y color)
  (and
   (clear-solid-disk (make-posn X-BULBS y) BULB-RADIUS color)
   (draw-circle (make-posn X-BULBS y) BULB-RADIUS color)))

;; and let's test that our function works as expected
;; observe the results on the canvas as well
(clear-bulb 'red)
(clear-bulb 'yellow)
(clear-bulb 'green)
(clear-bulb 'blue)