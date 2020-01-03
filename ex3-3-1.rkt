;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex3-3-1) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp")) #f)))
(define CMS_PER_INCH 2.54)
(define INCHES_PER_FOOT 12)
(define FEET_PER_YARD 3)
(define YARDS_PER_ROD 5.5)
(define RODS_PER_FURLONG 40)
(define FURLONGS_PER_MILE 8)

;; inches->cm : number[inches] -> number[cms]
;; to compute the number of centimeters in a given number of inches
;; for 1 inch, the result should be 2.54
;; for 2 inches, the result should be 5.08
;; for 0.5 inches, the result should be 1.27
(define (inches->cm inches)
  (* inches CMS_PER_INCH))

;; feet->inches : number[feet] -> number[inches]
;; to compute the number of inches in a given number of feet
;; for 1 foot, the result should be 12
;; for 0.5 feet, the result should be 6
;; for 3 feet, the result should be 36
(define (feet->inches feet)
  (* feet INCHES_PER_FOOT))

;; yards->feet : number[yards] -> number[feet]
;; to compute the number of feet in a given number of yards
;; for 1 yard, the result should be 3
;; for 10 yards, the result should be 30
;; for 0 yards, the result should be 0
(define (yards->feet yards)
  (* yards FEET_PER_YARD))

;; rods->yards : number[rods] -> number[yards]
;; to computer the number of yards in a given number of rods
;; for 1 rod, the answer should be 5.5 yards
;; for 3 rods, the answer should be 16.5 yards
;; for 0.1 rods, the answer should be 0.55 yards
(define (rods->yards rods)
  (* rods YARDS_PER_ROD))

;; furlongs->rods : number[furlongs] -> number[rods]
;; to compute the number of rods in a given number of furlongs
;; for 1 furlong, the fresult should be 40
;; for 2.5 furlongs, the result should be 100
;; for 5 furlongs, the result should be 200
(define (furlongs->rods furlongs)
  (* furlongs RODS_PER_FURLONG))

;; miles->furlongs : number[miles] -> number[furlongs]
;; to compute the number of furlongs in a given number of miles
;; for 1 mile, she result should be 8 furlongs
;; for 30 miles, the result should be 240 furlongs
;; for 0.1 miles, the result should be 0.8 furlongs
(define (miles->furlongs miles)
  (* miles FURLONGS_PER_MILE))

;; feet->cm : number[feet] -> number[cms]
;; to computer the number of centimeters in a given number of feet
;; for 1 foot, the result should be 1 * 12 * 2.54 = 24 + 6 + 0.48 = 30.48
;; for 3 feet, the result should be 3 * 12 * 2.54 = 72 + 18 + 1.44 = 91.44
;; for 0.5 feet, the result should be 0.5 * 12 * 2.54 = 15.24
(define (feet->cm feet)
  (inches->cm (feet->inches feet)))

;; yards->cm : number[yards] -> number[cms]
;; to computer the number of centimeters in a given number of yards
;; for 1 yard, the result should be 1 * 3 * 12 * 2.54 = 91.44
;; for 3 yards, the result should be 270 + 3 + 1.32 = 274.32
;; for 0 yards, the result should be 0
(define (yards->cm yards)
  (feet->cm (yards->feet yards)))

;; rods->inches : number[rods] -> number[inches]
;; to compute the number of inches in a given number of rods
;; for 1 rod, the result should be 1 * 5.5 * 3 * 12 = 198
;; for 2 rods, the result should be 396
;; for 0.5 rods, the result should be 99
(define (rods->inches rods)
  (feet->inches (yards->feet (rods->yards rods))))

;; miles->feet : number[miles] -> number[feet]
;; to compute the number of feet in a given number of miles
;; for 1 mile, the result should be 1 * 8 * 40 * 5.5 * 3 = 1760 * 3 = 5100 + 180 = 5280
;; for 3 miles, the result should be 15840
;; for 0.1 miles, the result should be 528
(define (miles->feet miles)
  (yards->feet (rods->yards (furlongs->rods (miles->furlongs miles)))))