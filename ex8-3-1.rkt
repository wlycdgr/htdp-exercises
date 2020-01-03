;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex8-3-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; 8.3.1
;; 1.
(+ (* (/ 12 8) 2/3)
   (-20 (sqrt 4)))
;; ->
(+ (* 1.5 2/3)
   (-20 (sqrt 4)))
;; ->
(+ 1
   (-20 (sqrt 4)))
;; ->
(+ 1 (- 20 2))
;; ->
(+ 1 18)
;; ->
19

;; 2.
(cond
  [(= 0 0) false]
  [(> 0 1) (symbol=? 'a 'a)]
  [else (= (/ 1 0) 9)])
;; evaluate first condition ->
(cond
  [true false]
  [(> 0 1) (symbol=? 'a 'a)]
  [else (= (/ 1 0) 9)])
;; cond_true applies, so we use the answer in the first line ->
false

;; 3.
(cond
  [(= 2 0) false]
  [(> 2 1) (symbol=? 'a 'a)]
  [else (= (/ 1 2) 9)])
;; evaluate first condition ->
(cond
  [false false]
  [(> 2 1) (symbol=? 'a 'a)]
  [else (= (/ 1 2) 9)])
;; cond_false applies, so we eliminate the first line ->
(cond
  [(> 2 1) (symbol=? 'a 'a)]
  [else (= (/ 1 2) 9)])
;; evaluate first condition ->
(cond
  [true (symbol=? 'a 'a)]
  [else (= (/ 1 2) 9)])
;; cond_true applies, so we evaluate the answer expression in the first line and use that ->
true