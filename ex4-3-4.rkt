;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex4-3-4) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp")) #f)))
;; for n == 500, the value is 40
;; for n == 2800, the value is 40 + 1800 * 0.045 = 40 + 45 + 36 = 121
;; for n == 15000, the value is 40 + 180 + 5000 * 0.055 = 40 + 180 + 275 = 495