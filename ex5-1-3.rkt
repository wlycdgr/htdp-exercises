;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex5-1-3) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
;; check-guess : number number -> symbol
;; to determine and report whether a guess number is less than, greater than, or equal to a target numbrer

;; data analysis
;; we have 3 distinct possibilities
;; guess could be bigger than target -> return 'TooLarge
;; guess could be smaller than target -> return 'TooSmall
;; guess could be right on target -> return 'Perfect

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

;; ---------------------------

;; check-guess3 : number number number number -> symbol
;; to determine and report how a guess number made up of three provided digits
;; relates to a provided target number

;; data analysis
;; again, 3 distinct possibilities
;; number made up of digits is smaller than, same as, or larger than guess
;; so, we need a condition expression with 3 condition clauses

;; examples
;; 1 2 3 500 -> 'TooSmall
;; 4 7 2 274 -> 'Perfect
;; 3 3 9 882 -> 'TooLarge

;; structural definition
;(define (check-guess3 ones tens hundreds target)
;  (cond
;    [... ...]
;    [... ...]
;    [... ...]))

;; add conditions to structural definition
;; as we do this, we realize we need a helper to reduce duplication
;(define (check-guess3 ones tens hundreds target)
;  (cond
;    [(< (build-3-digit-number ones tens hundreds) target) ...]
;    [(= (build-3-digit-number ones tens hundreds) target) ...]
;    [(> (build-3-digit-number ones tens hundreds) target) ...]))

;; ...so, we define the helper
;; build-3-digit-number : number number number -> number
;; to build a 3-digit number from the provided digits
(define (build-3-digit-number ones tens hundreds)
  (+ (* hundreds 100)
     (* tens 10)
     ones))

;; flesh out the definition with the answers
;(define (check-guess3 ones tens hundreds target)
;  (cond
;    [(< (build-3-digit-number ones tens hundreds) target) 'TooSmall]
;    [(= (build-3-digit-number ones tens hundreds) target) 'Perfect]
;    [(> (build-3-digit-number ones tens hundreds) target) 'TooLarge]))

;; re-use our check-guess function!
(define (check-guess3 ones tens hundreds target)
  (check-guess (build-3-digit-number ones tens hundreds) target))

;; express examples as tests
(symbol=? (check-guess3 1 2 3 500) 'TooSmall)
(symbol=? (check-guess3 4 7 2 274) 'Perfect)
(symbol=? (check-guess3 3 3 9 882) 'TooLarge)

;; test with teachpack
(guess-with-gui-3 check-guess3)