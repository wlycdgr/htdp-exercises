;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex5-1-2) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
;; check-guess : number number -> symbol
;; to determine and report whether a guess number is less than, greater than, or equal to a target numbrer

;; data analysis
;; we have 3 distinct possibilities
;; guess could be bigger than target => return 'TooLarge
;; guess could be smaller than target => return 'TooSmall
;; guess could be right on target => return 'Perfect

;; structural definition
;(define (check-guess guess target)
;  (cond
;    [... ...]
;    [... ...]
;    [... ...]))

;; take the structural definition and flesh out the conditions
;(define (check-guess guess target)
;  (cond
;    [(< guess target) ...]
;    [(= guess target) ...]
;    [(> guess target) ...]))

;; finally, add the answers
(define (check-guess guess target)
  (cond
    [(< guess target) 'TooSmall]
    [(= guess target) 'Perfect]
    [(> guess target) 'TooLarge]))

;; add tests
(symbol=? (check-guess 0 86) 'TooSmall)
(symbol=? (check-guess 86 86) 'Perfect)
(symbol=? (check-guess 99 86) 'TooLarge)

(guess-with-gui check-guess)