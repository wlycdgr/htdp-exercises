;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex4-2-4) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp")) #f)))
;; 2.2.1
(define (Fahrenheit->Celsius fahrenheitTemp)
  (* (- fahrenheitTemp 32) (/ 5 9)))

(= (Fahrenheit->Celsius 32) 0)
(= (Fahrenheit->Celsius 212) 100)
(= (Fahrenheit->Celsius -40) -40)

;; 2.2.2
(define (dollar->euro dollars)
  (* dollars 0.90))

(= (dollar->euro 1) 0.90)
(= (dollar->euro 2) 1.80)

;; 2.2.3
(define (triangle side height)
  (* side height 0.5))

(= (triangle 10 5) 25)
(= (triangle 2 5) 5)

;; 2.2.4
(define (convert3 ones tens hundreds)
  (+ ones
     (* 10 tens)
     (* 100 hundreds)))

(= (convert3 1 2 3) 321)
(= (convert3 5 3 9) 935)