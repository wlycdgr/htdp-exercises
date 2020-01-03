;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex9-1-4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; 9.1.4.
; provide a data definition for lists of two symbols

; a list-of-2-symbols is:,
; (cons x (cons y empty)),
; where x and y are symbols

; develop contains-2-doll

; contract
; contains-2-doll : list-of-2-symbols -> bool

; purpose
; to determine whether a list of 2 symbols contains the symbol 'doll

; definition
(define (contains-2-doll l-o2s)
  (or (eq? 'doll (first l-o2s))
      (eq? 'doll (first (rest l-o2s)))))

; tests
(contains-2-doll (cons 'doll (cons 'banana empty)))
(contains-2-doll (cons 'strawberry (cons 'doll empty)))
(not (contains-2-doll (cons 'dollhouse (cons 'big-doll empty))))