;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex9-5-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; 9.5.1
; Use DrScheme to test the definition of sum on the following lists of numbers

(define (sum lon)
  (cond
    [(empty? lon) 0]
    [else (+ (first lon) (sum (rest lon)))]))

(= 0 (sum empty))
(define 1-number-lon (cons 1.00 empty))
(= 1.00 (sum 1-number-lon))
(define 3-number-lon (cons 17.05 (cons 1.22 (cons 2.59 empty))))
(= (+ 17.05 1.22 2.59) (sum 3-number-lon))

(= 2.59 (sum (cons 2.59 empty)))
(= (+ 1.22 2.59)
   (sum (cons 1.22 (cons 2.59 empty))))
              
                     