;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex6-3-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; 6-3-3, baby
;; provide a structure definintion that represents an airforce's jet fighters
;; each fighter has four essential properties:
;; designation, acceleration, top-speed, range

(define-struct
  jet-fighter
  (designation acceleration top-speed range))

;; cool. now let's develop within-range function

;; within-range : jet-fighter number -> boolean
;; to determine whether the specified jet-fighter can reach a target at the specified distance from the base

;; example
;; jet-fighter ('mig22 100 800 300) and 200 should return true
;; jet-fighter ('short-boy 200 1200 100) and 200 shoul return false

(define (within-range jet-fighter distance)
  (>= (jet-fighter-range jet-fighter) distance))

;; now we convert our examples to tests
(define mig22 (make-jet-fighter 'mig22 100 800 300))
(within-range mig22 200)
(define short-boy (make-jet-fighter 'short-boy 200 1200 100))
(not (within-range short-boy 200))

;; cool
;; now, let's develop reduce-range

;; reduce-range : jet-fighter -> jet-fighter
;; to reduce a jet-fighter's range to 80% of its original value

;; example
;; (see original mig22 definition above)
;; (reduce-range mig22) should produce a new jet-fighter struct
;; with these fields ('mig22 100 800 240)

(define (reduce-range jet-fighter)
  (make-jet-fighter
   (jet-fighter-designation jet-fighter)
   (jet-fighter-acceleration jet-fighter)
   (jet-fighter-top-speed jet-fighter)
   (* (jet-fighter-range jet-fighter) (/ 8 10))))

;; test
(= 240
   (jet-fighter-range (reduce-range mig22)))
(= 80
   (jet-fighter-range (reduce-range short-boy)))