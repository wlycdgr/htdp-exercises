;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex5-1-5) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp")) #f)))
;; check-color : symbol symbol symbol symbol -> symbol
;; to check whether a player has correctly guesses the name and position of two ordered colors
;; and give appropriate feedback

;; data analysis
;; there are four distinct scenarios we care about
;; both colors and positions are right -> 'Perfect
;; one color & position combo is correct -> 'OneColorAtCorrectPosition
;; one color is present -> 'OneColorOccurs
;; none of the above are true -> 'NothingCorrect

;; examples
;; red blue red blue -> 'Perfect
;; blue red blue red -> 'Perfect
;; green green green green -> 'Perfect
;; red blue red green -> 'OneColorAtCorrectPosition
;; red red red blue -> 'OneColorAtCorrectPosition
;; blue red green red -> 'OneColorAtCorrectPosition
;; black white white green -> 'OneColorOccurs
;; black white white black -> 'OneColorOccurs
;; black black green green -> 'NothingCorrect
;; black black green blue -> 'NothingCorrect
;; blue green red red -> 'NothingCorrect
;; blue green red orange -> 'NothingCorrect

;; we sketch out the four-condition-clause structure of the function definition
;(define (check-color first-target second-target first-guess second-guess)
;  (cond
;    [... ...]
;    [... ...]
;    [... ...]
;    [... ...]))

;; we start fleshing it out by adding the conditions
;(define (check-color first-target second-target first-guess second-guess)
;  (cond
;    [(and (symbol=? first-target first-guess) (symbol=? second-target second-guess)) ...]
;    [(or (symbol=? first-target first-guess) (symbol=? second-target second-guess)) ...]
;    [(or (symbol=? first-target second-guess) (symbol=? second-target first-guess)) ...]
;    [else ...]))

;; we finish up by adding the answers
(define (check-color first-target second-target first-guess second-guess)
  (cond
    [(and (symbol=? first-target first-guess) (symbol=? second-target second-guess)) 'Perfect]
    [(or (symbol=? first-target first-guess) (symbol=? second-target second-guess)) 'OneColorAtCorrectPosition]
    [(or (symbol=? first-target second-guess) (symbol=? second-target first-guess)) 'OneColorOccurs]
    [else 'NothingCorrect]))

;; function compiles, so let's express the examples as tests
(symbol=? (check-color 'red 'blue 'red 'blue) 'Perfect)
(symbol=? (check-color 'blue 'red 'blue 'red) 'Perfect)
(symbol=? (check-color 'green 'green 'green 'green) 'Perfect)
(symbol=? (check-color 'red 'blue 'red 'green) 'OneColorAtCorrectPosition)
(symbol=? (check-color 'red 'red 'red 'blue) 'OneColorAtCorrectPosition)
(symbol=? (check-color 'blue 'red 'green 'red) 'OneColorAtCorrectPosition)
(symbol=? (check-color 'black 'white 'white 'green) 'OneColorOccurs)
(symbol=? (check-color 'black 'white 'white 'black) 'OneColorOccurs)
(symbol=? (check-color 'black 'black 'green 'blue) 'NothingCorrect)
(symbol=? (check-color 'blue 'green 'red 'red) 'NothingCorrect)
(symbol=? (check-color 'blue 'green 'red 'orange) 'NothingCorrect)

(master check-color)