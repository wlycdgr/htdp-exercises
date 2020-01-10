;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex9-5-5) (read-case-sensitive #t) (teachpacks ((lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.rkt" "teachpack" "htdp")) #f)))
; 9.5.5
; develop the function 'convert'

; contract
; convert : list-of-numbers -> number

; purpose
; to convers a list of digits into the corresponding number, where the first digit
; is the least significant

; example
; (convert empty) should be ..... 0?
; (convert (cons 3 empty)) should be 3
; (convert (cons 2 (cons 3 empty))) should be 23

; definition
(define (convert lon)
  (cond
    [(empty? lon) 0]
    [else (+ (* (first lon)
                (expt 10 (- (length-of-list lon) 1)))
             (convert (rest lon)))]))

; we need a helper to figure out the length of the list
(define (length-of-list lon)
  (cond
    [(empty? lon) 0]
    [else (+ 1 (length-of-list (rest lon)))]))

(= 32 (convert (cons 3 (cons 2 empty))))
(= 740 (convert (cons 7 (cons 4 (cons 0 empty)))))
(= 0 (convert empty))
(= 3 (convert (cons 3 empty)))

; ...and if we want to convert it in the opposite direction?
; (i.e. with the innermost list item being most significant)?

; example
; (convert (cons 2 (cons 3 empty))) should be 32
; (convert (cons 4 (cons 6 (cons 2 empty)))) should be 264

(define (convert-backwards lon)
  (cond
    [(empty? lon) 0]
    [else (+ (first lon)
             (* 10 (convert-backwards (rest lon))))]))

(= 32 (convert-backwards (cons 2 (cons 3 empty))))
(= 264 (convert-backwards (cons 4 (cons 6 (cons 2 empty)))))

; 9.5.5 part 2
; also, develop the function 'check-guess-for-list'
; It should implement a general version of the number-guessing game of exercise 5.1.3

; data definitions
; a Digit is one of 0, ... , 9
; a List-Of-Digits is either:
; - empty, or
; - (cons d List-Of-Digits), where d is a Digit

; a Guess-Answer is one of the following 3 symbols:
; 'TooSmall, 'Perfect, 'TooLarge

; contract
; check-guess-for-list : List-Of-Digits number -> Guess-Answer

; purpose
; to determine and report how a player's guess (represented as a List-of-Digits)
; relates to a specified hidden number

; template
; (define (compare_fun lod n)
;   (cond
;      [(< (convert lod) n) ...]
;      [(> (convert lod) n) ...]
;      [else ...]))

; definition
(define (check-guess-for-list lod n)
  (cond
    [(< (convert-backwards lod) n) 'TooSmall]
    [(> (convert-backwards lod) n) 'TooLarge]
    [else 'Perfect]))

(eq? (check-guess-for-list (cons 3 (cons 2 empty)) 30) 'TooSmall)
(eq? (check-guess-for-list (cons 2 (cons 3 empty)) 30) 'TooLarge)
(eq? (check-guess-for-list (cons 5 (cons 4 (cons 8 empty))) 845) 'Perfect)

(guess-with-gui-list 5 check-guess-for-list)