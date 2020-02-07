;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex10-1-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; 10.1.3
; develop convertFC

; convertFC : lon -> lon
; to convert a list of Fahrenheit temps to a list of the corresponding Celsius temps
; (define (convertFC list-of-fahr-temps) ...)

; template
; (define (convertFC list-of-fahr-temps)
;    (cond
;      [(empty? list-of-fahr-temps) ...]
;      [else ... (first list-of-fahr-temps) ... (rest list-of-fahr-temps) ...]))

; example!
; (define big-fahrs (cons 212 (cons 98.6 (cons 32 empty))))
; (convertFC big-fahrs) should produce
; (cons 100 (cons 36.6 (cons 0 empty)))
; [ed. note: 36.6 is approximate & from memory ~]

; definition!
(define (convertFC list-of-fahr-temps)
  (cond
    [(empty? list-of-fahr-temps) empty]
    [else (cons (FtoC (first list-of-fahr-temps)) (convertFC (rest list-of-fahr-temps)))]))

; helper to handle the actual individual conversions!
(define (FtoC fahr-temp)
  (* (- fahr-temp 32)
     (/ 5 9)))

;test
(define big-fahrs (cons 212 (cons 98.6 (cons 32 empty))))
(convertFC big-fahrs)