;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex10-2-4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; 10.2.5
; define extract>1

; an inv-record is a struct:
; (make-inv-record s n)
; where s is a name symbol
; and n is a price number
(define-struct inv-record (name price)) 

; an inventory is either:
; 1, empty, or
; 2, (cons ir inv), where ir is an inv-record and inv is an inventory

; extract>1 : inventory -> inventory
; filters all dollar and below items out of an inventory
; (define (extract>1 inv) ...)

(define (extract>1 inv)
  (cond
    [(empty? inv) empty]
    [(< 1 (inv-record-price (first inv))) (cons (first inv) (extract>1 (rest inv)))]
    [else (extract>1 (rest inv))]))

; test
(define toys (cons (make-inv-record 'dagger .95)
                   (cons (make-inv-record 'Barbie 17.95)
                         (cons (make-inv-record 'key-chain .55)
                               (cons (make-inv-record 'robot 22.05) empty)))))

(define 