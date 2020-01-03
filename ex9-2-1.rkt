;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex9-2-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; 9.2.1
; show that all the inventory lists discussed at the beginning of section 9.2 belong to
; the class list-of-symbols

; 1
; empty
; belongs by part 1 of the definition of list-of-symbols

; 2
; (cons 'ball empty)
; empty is a list of symbols by part 1 of the definition
; therefore this construct is of the form (cons symbol list-of-symbols)
; this is a list of symbols by part 2 of the definition

; 3
; (cons 'arrow (cons 'ball empty))
; we showed in 2 that (cons 'ball empty) is a list-of-symbols
; then the construct is of the form (cons symbol list-of-symbols)
; this is a list-of-symbols by part 2 of the definition

; 4
; (cons 'clown empty)
; this construct is analogous to the one in 2 and is a list-of-symbols by the same reasoning

; 5
; (cons 'bow (cons 'arrow empty))
; analogous to 3

; 6
; (cons 'clown (cons 'doll (cons 'arrow (cons 'ball empty))))
; innermost piece is a list-of-symbols as per 2
; next innermost is a list-of-symbols as per 3
; (cons 'doll list-of-symbols) is a list-of-symbols by part 2 of the definition, since 'doll is a symbol
; (cons 'clown list-of-symbols) is a list-of-symbols by the same logic