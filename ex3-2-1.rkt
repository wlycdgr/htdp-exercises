;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex3-2-1) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp")) #f)))
(define BASE_ATTENDEES 120)
(define BASE_PRICE 5.00)
(define ATTENDEES_PER_PRICE_STEP 15)
(define PRICE_STEP 0.1)
(define COST_PER_ATTENDEE 1.50)

;; attendees : number -> number
;; to compute the number of attendees, given the ticket-price
;; at $3.00 per ticket, the number of attendees should be 120 + (15 * ((5 - 3) / 0.1)) = 420
;; at $4.00 per ticket, the number of attendees should be 120 + (15 * ((5 - 4) / 0.1)) = 270
;; at $5.00 per ticket, the number of attendees should be 120
(define (attendees ticket-price)
  (+ BASE_ATTENDEES
     (* (/ ATTENDEES_PER_PRICE_STEP PRICE_STEP)
        (- BASE_PRICE ticket-price))))

;; cost : number -> number
;; to computer how much it costs to run a show at a given ticket price
;; at $3.00 per ticket, the cost should be $180 + (420 attendees * 0.04) = $196.80
;; at $4.00 per ticket, the cost should be $180 + (270 attendees * 0.04) = $190.80
;; at $5.00 per ticket, the cost should be $180 + (120 attendees * 0.04) = $184.80
(define (cost ticket-price)
  (* COST_PER_ATTENDEE (attendees ticket-price)))

;; revenue : number -> number
;; to compute the revenue at a given ticket price
;; at $3.00 per ticket, the revenue should be $3.00 * (420 attendees) = $1260
;; at $4.00 per ticket, the revenue should be $4.00 * (270 attendees) = $1080
;; at $5.00 per ticket, the revenue should be $5.00 * (120 attendees) = $600
(define (revenue ticket-price)
  (* ticket-price
     (attendees ticket-price)))

;; profit: number -> number
;; to compute the profit at a given ticket price
;; at $3.00 per ticket, it should be (- (revenue 3) (cost 3)) = (- $1260 $196.80) = $1063.20
;; at $4.00 per ticket, it should be (- (revenue 4) (cost 4)) = (- $1080 $190.80) = $889.20
;; at $5.00 per ticket, it should be (- $600 $184.80) = $415.20
(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

(define (bad-profit price)
  (- (* (+ 120
           (* (/ 15 .10)
              (- 5.00 price)))
        price)
     (* 1.50
           (+ 120
              (* (/ 15 .10)
                 (- 5.00 price))))))