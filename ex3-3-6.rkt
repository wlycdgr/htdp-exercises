;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex3-3-6) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp")) #f)))
;; Fahrenheit->Celsius : number -> number
;; to compute the Celsius equivalent of a temperature given in Fahrenheit
(define (Fahrenheit->Celsius fahr)
  (* (- fahr 32) (/ 5 9)))

;; Celsius->Fahrenheit : number -> number
;; to compute the Fahrenheit equivalent of a temperature given in Celsius
(define (Celsius->Fahrenheit celsius)
  (+ (* celsius (/ 9 5)) 32))

;; I : number -> number
;; to convert a Fahrenheit temperature to Celsius and back
(define (I f)
  (Celsius->Fahrenheit (Fahrenheit->Celsius f)))

;; (Fahrenheit->Celsius 32) "should be" 0
;; (Fahrenheit->Celsius 212) "should be" 100

;; (Celsius->Fahrenheit 0) "should be" 32
;; (Celsius->Fahrenheit 100) "should be" 212

(I 32) "should be" 32