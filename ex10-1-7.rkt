;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex10-1-7) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; 10.1.7
; develop the function recall

; recall : list-of-symbols symbol -> list-of-symbols
; to filter all occurrences of a symbol out of a list of symbols
; and return the filtered list
; (define (recall los s) ... )

; example
; (define toys (cons 'legos (cons 'doll (cons 'chess empty))))
; (recall toys 'doll) should return
; (cons 'legos (cons 'chess empty))

(define (recall los s)
  (cond
    [(empty? los) empty]
    [else (cond
            [(symbol=? (first los) s) (recall (rest los) s)]
            [else (cons (first los) (recall (rest los) s))])]))

; let's test!
(define toys (cons 'legos (cons 'doll (cons 'chess empty))))
(recall toys 'doll)