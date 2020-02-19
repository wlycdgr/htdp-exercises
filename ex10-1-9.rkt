;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex10-1-9) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; 10.1.9
; develop controller

;; controller : number -> loc
;; the function consumes a number and produces a list with 5 items
;; * the number of dollars
;; * 'dollar if there is 1, 'dollars otherwise
;; * 'and
;; * the number of cents
;; * 'cent if there is 1, 'cents otherwise
(define (controller total-cents)
  (combine
   (one-amount (quotient total-cents 100) 'dollar 'dollars)
   (one-amount (remainder total-cents 100) 'cent 'cents)))

;; function that combines the dollar and cent amounts, if any,
;; adding 'and as appropriate
(define (combine dollar-words cent-words)
  (cond
    [(empty? dollar-words) cent-words]
    [(empty? cent-words) dollar-words]
    [else (append dollar-words (list 'and) cent-words)]))

;; function that determines the correctly pluralized string
;; representation of a currency amount
(define (one-amount n singular-form plural-form)
  (cond
    [(= 0 n) empty]
    [(= 1 n) (list 1 singular-form)]
    [else (list n plural-form)]))

(controller 0)
(controller 1)
(controller 2)
(controller 100)
(controller 101)
(controller 110)
(controller 300)
(controller 301)
(controller 325)