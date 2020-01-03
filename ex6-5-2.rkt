;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex6-5-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Data analysis and definition
(define-struct time (h m s))
;; time is a structure:
;;    (make-time h m s)
;; where h, m, and s are numbers

;; h, m, and s represent the hours, minutes, and seconds since midnight

;; Contract
;; time->seconds : time -> number
;; to calculate how many seconds since midnight a given time structure represents

;; Examples
;; (time->seconds (make-time 1 1 10))
;; should be 10 + 1 * 60 + 1 * 3600 = 3670
;; (time-seconds (make-time 0 10 30))
;; should be 30 + 10 * 60 + 0 * 3600 = 630

;; Template
;(define (time-template a-time)
;  ... (time-h a-time) ...
;  ... (time-m a-time) ...
;  ... (time-s a-time) ...

;; Definition
(define (time->seconds a-time)
  (+ (* (time-h a-time) 3600)
     (* (time-m a-time) 60)
     (time-s a-time)))

;; Examples re-expressed as Tests
(= (time->seconds (make-time 1 1 10)) 3670)
(= (time->seconds (make-time 0 10 30)) 630)