;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex6-3-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; 6-3-2

(define-struct movie (title producer))

(symbol=?
 'ThePhantomMenace
 (movie-title (make-movie 'ThePhantomMenace 'Lucas)))

(symbol=?
 'Lucas
 (movie-producer (make-movie 'TheEmpireStrikesBack 'Lucas)))

;; (movie-title (make-movie x y)) evaluates to x
;; (movie-producer (make-movie x y)) evaluates to y

;; x = (movie-title (make-movie x y))
;; y = (movie-title (make-movie x y))

;; or, with symbol=?, if we want a Scheme way

