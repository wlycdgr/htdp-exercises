;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex6-5-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; movie-template : movie -> ???
(define-struct movie (title producer))
(define (movie-template a-movie)
  ... (movie-title a-movie) ...
  ... (movie-producer a-movie) ...)

;; does not compile! but, can still define templates

;; boyfriend-template : boyfriend -> ???
(define-struct boyfriend (name hair eyes phone))
(define (boyfriend-template a-boyfriend)
  ... (boyfriend-name a-boyfriend) ...
  ... (boyfriend-hair a-boyfriend) ...
  ... (boyfriend-eyes a-boyfriend) ...
  ... (boyfriend-phone a-boyfriend) ...)

;; cheeerleader-template : cheerleader -> ???
(define-struct cheeerleader (name number))
(define (cheerleader-template a-cheerleader)
  ... (cheerleader-name a-cheerleader) ...
  ... (cheerleader-number a-cheerleader) ...)

;; CD-template : CD -> ???
(define-struct CD (artist title price))
(define (CD-template a-CD)
  ... (CD-artist a-CD) ...
  ... (CD-title a-CD) ...
  ... (CD-price a-CD) ...)

;; sweater-template : sweater -> ???
(define-struct sweater (material size producer))
(define (sweater-template a-sweater)
  ... (sweater-material a-sweater) ...
  ... (sweater-size a-sweater) ...
  ... (sweater-producer a-sweater) ...)