;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex6-4-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct three-letter-word (first-letter second-letter third-letter))

;; a three-letter-word is a structure:
;;     (make-three-letter-word first-letter second-letter third-letter)
;; where first-letter, second-letter, and third-letter are letters
;; a letter is a one-character symbol, 'a through 'z