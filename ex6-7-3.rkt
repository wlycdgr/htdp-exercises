;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex6-7-3) (read-case-sensitive #t) (teachpacks ((lib "hangman.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "hangman.rkt" "teachpack" "htdp")) #f)))
;; 6.7.1 draw-next-part
;; draw-next-part : symbol:hangman-part -> true, draws matching part of figure
;; to draw the specified hangman picture part
;; accepts 'right-leg, 'left-leg 'left-arm 'right-arm 'body 'head 'noose

(start 250 375)

(define (draw-noose c)
  (and
   (draw-solid-line (make-posn 0 20) (make-posn 125 20) c)
   (draw-solid-line (make-posn 125 20) (make-posn 125 50) c)
   (draw-circle (make-posn 150 75) 35 'red)))

(define (draw-head c)
  (draw-circle (make-posn 125 75) 10 c))

(define (draw-body c)
  (draw-solid-line (make-posn 125 85) (make-posn 125 175) c))

(define (draw-arm direction)
  (draw-solid-line
   (make-posn 125 100)
   (make-posn (+ 125 (* direction 80)) 90)
   'black))

(define (draw-leg direction)
  (draw-solid-line
   (make-posn 125 175)
   (make-posn (+ 125 (* direction 110)) 215)
   'black))

(define (draw-next-part part)
  (cond
    [(symbol=? part 'noose) (draw-noose 'black)]
    [(symbol=? part 'head) (draw-head 'black)]
    [(symbol=? part 'body) (draw-body 'black)]
    [(symbol=? part 'right-arm) (draw-arm 1)]
    [(symbol=? part 'left-arm) (draw-arm -1)]
    [(symbol=? part 'right-leg) (draw-leg 1)]
    [(symbol=? part 'left-leg) (draw-leg -1)]
    [else ...]))

;(draw-next-part 'noose)
;(draw-next-part 'head)
;(draw-next-part 'body)
;(draw-next-part 'right-arm)
;(draw-next-part 'left-arm)
;(draw-next-part 'right-leg)
;(draw-next-part 'left-leg)

;; 6.7.2
(define-struct word (first second third))
;; a word is a structure:
;;    (make-word first second third)
;; where first, second, and third are letters
;; a letter is a character 'a through 'z, or '_


;; 6.7.3
;; reveal : word word letter -> word
;; to check a guess against the word we have to guess and produce
;; an updated status word based on the result

;; we realize we need a helper that checks each letter
(define (reveal secret-word status-word guess)
  (make-word
   (reveal-letter (word-first secret-word) (word-first status-word) guess)
   (reveal-letter (word-second secret-word) (word-second status-word) guess)
   (reveal-letter (word-third secret-word) (word-third status-word) guess)))

;; ...so we define this helper
(define (reveal-letter secret-letter status-letter guess)
  (cond
    [(symbol=? secret-letter guess) secret-letter]
    [else status-letter]))

;; now we test
(define _e_ (reveal (make-word 't 'e 'a) (make-word '_ 'e '_) 'u))
(and
 (symbol=? (word-first _e_) '_)
 (symbol=? (word-second _e_) 'e)
 (symbol=? (word-third _e_) '_))

(define a_e (reveal (make-word 'a 'l 'e) (make-word 'a '_ '_) 'e))
(and
 (symbol=? (word-first a_e) 'a)
 (symbol=? (word-second a_e) '_)
 (symbol=? (word-third a_e) 'e))

(define _ll (reveal (make-word 'a 'l 'l) (make-word '_ '_ '_) 'l))
(and
 (symbol=? (word-first _ll) '_)
 (symbol=? (word-second _ll) 'l)
 (symbol=? (word-third _ll) 'l))

(hangman make-word reveal draw-next-part)