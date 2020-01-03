;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Untitled) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp")) #f)))
(define PI 3.1415926)

;; area-of-disk : number[radius] -> number[area]
;; to compute the area of a disk given its radius
(define (area-of-disk radius)
  (* (sqr radius) PI))

;; volume-cylinder : number[base-radius] number[height] -> number[volume]
;; to compute the volume of a cylinder given its height and base radius
(define (volume-cylinder base-radius height)
  (* (area-of-disk base-radius) height))