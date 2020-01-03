;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex4-2-2) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp")) #f)))
;; 1
;; in-interval-1? : number -> boolean
;; to determine whether a number if between -3 and 0 exclusive

;; 2
;; in-interval-2? : number -> boolean
;; to determine whether a numbrer is not between 1 and 2 inclusive

;; 3
;; in-interval-3? : number -> boolean
;; to determine whether a number is not between 1 and 5 inclusive

;; 1
;; (in-interval-1? -2)
;; (and (< -3 -2) (< -2 0))
;; (and (true) (< -2 0))
;; (and (true) (true))
;; (true)

;; 2
;; (in-interval-2? -2)
;; (or (< -2 1) (> -2 2))
;; (or (true) (> -2 2))
;; (true)

;; 3
;; (in-interval-3? -2)
;; (not (and (<= 1 -2) (<= -2 5)))
;; (not (and (false) (<= -2 5)))
;; (not (false))
;; (true)

