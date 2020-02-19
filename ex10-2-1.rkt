;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex10-2-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; 10.2.1
; adapt contains-doll? to consume inventories
; instead of lists of symbols

; an inventory is either
; 1, empty, or
; 2, (cons ir inv), where ir is an inventory record and inv is an inventory

; an inventory record ir is a structure:
; (make-ir name price)
; where name is a symbol and price is a number
; (define-struct ir (name price))

; contains-doll? : inventory -> boolean
; to determine whether an-inv contains a record for 'doll
; (define (contains-doll? an-inv) ...)

(define-struct ir (name price))

(define (contains-doll? an-inv)
  (cond
    [(empty? an-inv) false]
    [else (or
           (symbol=? 'doll (ir-name (first an-inv)))
           (contains-doll? (rest an-inv)))]))

; tests
(define no-doll-inv (cons (make-ir 'robot 22.05) empty))
(define inv-with-doll (cons (make-ir 'legos 17.95) (cons (make-ir 'doll 34.25) empty)))

(not (contains-doll? no-doll-inv))
(contains-doll? inv-with-doll)

; 10.2.1 part ii
; adapt contains? (a general version of contains-doll?)

; contains? : inventory symbol -> boolean
; consumes an inventory and an item name symbol
; and determines whether the inventory contains an item with that name
; (define (contains? inv s) ...)

(define (contains? inv s)
  (cond
    [(empty? inv) false]
    [else (or
           (symbol=? s (ir-name (first inv)))
           (contains? (rest inv) s))]))

;tests - all should return true
(define ball-and-robot (cons (make-ir 'ball 3.95) (cons (make-ir 'robot 234.95) empty)))
(define doll-and-telescope (cons (make-ir 'doll 74.95) (cons (make-ir 'telescope 725.00) empty)))

(contains? ball-and-robot 'robot)
(contains? doll-and-telescope 'telescope)
(not (contains? doll-and-telescope 'ball))