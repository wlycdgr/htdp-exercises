;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex10-1-2) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")) #f)))
; 10.1.2
; check that no entry in the hours list passed to hours->wages is >100

;; hours->wages : list-of-numbers -> list-of-numbers
;; calculates the corresponding list of wages for a list of hours worked
(define (hours->wages lon)
  (cond
    [(empty? lon) empty]
    [else (cons (wage (first lon)) (hours->wages (rest lon)))]))

(define (wage h)
  (* 12 h))

(define (checked-hours->wages lon)
  (cond
    [(empty? lon) empty]
    [else (cond
            [(> (first lon) 100) (error 'checked-hours->wages "too many hours")]
            [else (cons (wage (first lon)) (checked-hours->wages (rest lon)))])]))

(define pp-hours (cons 20 (cons 129 (cons 80 empty))))

;(hours->wages pp-hours)
(checked-hours->wages pp-hours)