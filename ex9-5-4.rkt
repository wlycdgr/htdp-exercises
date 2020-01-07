;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex9-5-4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; 9.5.4.
; Develop the function check-range1?, which consumes a list
; of temperature measurements (represented as numbers)
; and checks whether all measurements are between 5 and 95 C

; contract
; check-range1? : lon -> boolean

; purpose
; to check whether all the temperatures in a list of Celsius temperatures
; are between 5 and 95 C

; template
; same as in 9.5.3.

; definition
(define (check-range1? lon)
  (cond
    [(empty? lon) true]
    [else (and (and (< 5 (first lon))
                    (> 95 (first lon)))
               (check-range1? (rest lon)))]))

(check-range1? empty)
(not (check-range1? (cons 58 (cons 5 empty))))
(not (check-range1? (cons 95 (cons 10 empty))))
(not (check-range1? (cons 10 (cons 3 empty))))
(not (check-range1? (cons 37 (cons 25 (cons 98 empty)))))
(check-range1? (cons 7 (cons 13 (cons 13 empty))))

; generalize the function so that it uses a custom interval
(define (check-range-low-to-high? lon low high)
  (cond
    [(empty? lon) true]
    [else (and (and (< low (first lon))
                    (> high (first lon)))
               (check-range-low-to-high? (rest lon) low high))]))
