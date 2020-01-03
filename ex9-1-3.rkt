;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex9-1-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; 9.1.3.
; finish the development of add-up-3

; contract
; add-up-3: a-list-of-3-numbers -> number

; purpose
; to sum the numbers in a provided list of 3 numbers

; template
;(define (add-up-3 a-list-of-3-numbers)
;  ... (first a-list-of-3-numbers) ...
;  ... (first (rest a-list-of-3-numbers)) ...
;  ... (first (rest (rest a-list-of-3-numbers))) ...)

(define (add-up-3 a-list-of-3-numbers)
  (+ (first a-list-of-3-numbers)
     (first (rest a-list-of-3-numbers))
     (first (rest (rest a-list-of-3-numbers)))))

(define list-913 (cons 10 (cons 7 (cons 2 empty))))
(define list-913-2 (cons -2 (cons -5 (cons -8 empty))))

(= 19 (add-up-3 list-913))
(= -15 (add-up-3 list-913-2))

; develop distance-to-0-for-3 using the add-up-3 template
(define (distance-to-0-for-3 a-list-of-3-numbers)
  (sqrt
   (+ (sqr (first a-list-of-3-numbers))
      (sqr (first (rest a-list-of-3-numbers)))
      (sqr (first (rest (rest a-list-of-3-numbers)))))))

(define dist-list-1 (cons 1 (cons 0 (cons 0 empty))))
(define dist-list-4 (cons 0 (cons -4 (cons 0 empty))))

(= 1 (distance-to-0-for-3 dist-list-1))
(= 4 (distance-to-0-for-3 dist-list-4))