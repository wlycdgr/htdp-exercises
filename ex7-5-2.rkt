;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex7-5-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

(define (revenue ticket-price)
  (* (attendees ticket-price) ticket-price))

(define (cost ticket-price)
  (+ 180
     (* 0.04 (attendees ticket-price))))

(define (attendees ticket-price)
  (+ 120
     (* (/ 15 .10) (- 5.00 ticket-price))))

;; checked-profit : Scheme-value -> number
;; to calculate the profit for a given ticket price Scheme-value,
;; provided the Scheme-value is a positive number
(define (checked-profit v)
  (cond
    [(and (number? v) (< 0 v)) (profit v)]
    [else (error 'checked-profit "positive number expected")]))

;; (checked-profit 2)
;; (checked-profit 0)
;; (checked-profit -1)
;; (checked-profit 'banana)

;; next: is-between-5-6?
(define (is-between-5-6? n)
  (and (< 5 n) (< n 6)))

;; checked-is-between-5-6? : Scheme-value -> bool
;; to check whether a Scheme-value is between 5 and 6 exclusive,
;; provided Scheme-value is a number
(define (checked-is-between-5-6? v)
  (cond
    [(number? v) (is-between-5-6? v)]
    [else (error 'checked-is-between-5-6? "number expected")]))

;(not (checked-is-between-5-6? -1))
;(not (checked-is-between-5-6? 0))
;(not (checked-is-between-5-6? 1))
;(not (checked-is-between-5-6? 5))
;(checked-is-between-5-6? 5.5)
;(not (checked-is-between-5-6? 6))
;(not (checked-is-between-5-6? 7))
;; (checked-is-between-5-6? true) error!
;; (checked-is-between-5-6? 'blue) error!

;; NEXT
;; reply
(define (reply s)
  (cond
    [(symbol=? s 'GoodMorning) 'Yaaaawn!]
    [(symbol=? s 'Goodbye) 'Later!]
    [else 'Huh?]))

;; checked-reply : Scheme-value -> symbol
;; to reply to a Scheme-value with a bit of conversation
;; provided that Scheme-value is a symbol
(define (checked-reply v)
  (cond
    [(symbol? v) (reply v)]
    [else (error 'checked-reply "symbol expected")]))

;(symbol=? (checked-reply 'GoodMorning) 'Yaaaawn!)
;(symbol=? (checked-reply 'Goodbye) 'Later!)
;(symbol=? (checked-reply 'Banana) 'Huh?)
;(checked-reply 2) error!

;; NEXT!
;; distance-to-0
(define (distance-to-0 a-posn)
  (sqrt
   (+ (sqr (posn-x a-posn))
      (sqr (posn-y a-posn)))))

;; checked-distance-to-0 : Scheme-value -> number
;; to compute the distance of a Scheme-value to the origin
;; provided Scheme-value is a posn
(define (checked-distance-to-0 v)
  (cond
    [(posn? v) (distance-to-0 v)]
    [else (error 'checked-distance "posn expected")]))

;(= 1 (checked-distance-to-0 (make-posn 1 0)))
;(checked-distance-to-0 3) error!

;; NEXT! and LAST!
;; perimeter
(define PI 3.14)
(define-struct circle (center radius))
(define-struct square (nw length))
;; a shape is a circle or a square

(define (perimeter a-shape)
  (cond
    [(circle? a-shape) (* (* 2 (circle-radius a-shape)) PI)]
    [(square? a-shape) (* 4 (square-length a-shape))]))

;; checked-perimeter : Scheme-value -> number
;; to calculate the perimeter of a Scheme-value provided
;; that Scheme-value is a shape: a circle of a square
(define (checked-perimeter a-shape)
  (cond
    [(or (circle? a-shape) (square? a-shape)) (perimeter a-shape)]
    [else (error 'checked-perimeter "shape expected")]))

;(define circle-752 (make-circle (make-posn 10 10) 2))
;(= (* 4 PI) (checked-perimeter circle-752))
;
;(define square-752 (make-square (make-posn 10 10) 8))
;(= 32 (checked-perimeter square-752))

;; (checked-perimeter 3) error!