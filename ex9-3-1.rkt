;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex9-3-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; 9.3.1
; Test the definition of contains-doll?

; contract
; contains-doll? : a-list-of-symbols -> boolean

; purpose
; to determine whether a list of symbols contains the symbol 'doll

; definition
(define (contains-doll? los)
  (cond
    [(empty? los) false]
    [else (cond
            [(symbol=? (first los) 'doll) true]
            [else (contains-doll? (rest los))])]))

(not (contains-doll? empty))
(not (contains-doll? (cons 'ball empty)))
(contains-doll? (cons 'arrow (cons 'doll empty)))
(not (contains-doll? (cons 'bow (cons 'arrow (cons 'ball empty)))))
                     