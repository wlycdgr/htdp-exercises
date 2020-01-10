;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex9-5-8) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))
; 9.5.8.
; Develop the function draw-circles,
; which consumes a posn p and a list of numbers.
; Each number of the list represents the radius of some circle
; The function draws concentric red circles around p on the canvas
; Using the operation draw-circle
; Its result is true if it can draw all of them
; Otherwise there has been an error and it does not need to produce a value

; contract
; draw-circles : posn lon -> true?


; purpose
; see above

; definition
(define (draw-circles center radii)
  (cond
    [(empty? radii) true]
    [else (and (draw-circle center (first radii) 'red)
               (draw-circles center (rest radii)))]))

(start 300 300)

(define c1 (make-posn 150 150))
(define radii (cons 5 (cons 10 (cons 20 (cons 40 (cons 80 empty))))))

(draw-circles c1 radii)