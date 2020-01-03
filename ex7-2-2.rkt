;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex7-2-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; 7.2.2

(define-struct bus (seats doors engine year))
(define-struct limo (length color has-sunroof))
(define-struct metro-car (make model year mileage))
(define-struct subway (gauge signboard-type))

;; A city-vehicle is:
;;   a bus struct: (make-bus seats doors engine year)
;;   where seats, year, and doors are numbers
;;   and engine is either 'diesel, 'hybrid, or 'electric
;;     OR
;;   a limo struct: (make-limo length color has-sunroof)
;;   where length is a number,
;;   color is a symbol,
;;   and has-sunroof is a boolean
;;     OR
;;   a metro-car struct: (make-metro-car make model year mileage)
;;   where year and mileage are numbers
;;   and make and model are symbols
;;     OR
;;   a subway struct: (make-subway gauge signboard-type)
;;   where gauge is a number representing the width between the wheels
;;   and signboard-type is a symbol that is one of 'electric, 'print

;; TEMPLATE
;; city-vehicle-consumer : city-vehicle -> ???
(define (city-vehicle-consumer a-city-vehicle)
  (cond
    [(bus? a-city-vehicle)
     ...]
    [(limo? a-city-vehicle)
     ...]
    [(metro-car? a-city-vehicle)
     ...]
    [(subway? a-city-vehicle)
     ...]))

;; we flesh out all the conditions with the details of each struct