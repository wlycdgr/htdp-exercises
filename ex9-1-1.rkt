;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex9-1-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; 9.1.1 create Scheme lists that represent...

; 1. the list of all planets in our solar system:
(cons 'Mercury
      (cons 'Venus
            (cons 'Earth
                  (cons 'Mars
                        (cons 'Jupiter
                              (cons 'Saturn
                                    (cons 'Neptune
                                          (cons 'Uranus
                                                (cons 'Pluto empty)))))))))

; 2. the following meal: steak, pommes-frites, beans, bread,
; water, juice, brie-cheese, and ice-cream:
(cons 'steak
      (cons 'pommes-frites
            (cons 'beans
                  (cons 'bread
                        (cons 'water
                              (cons 'juice
                                    (cons 'brie-cheese
                                          (cons 'ice-cream empty))))))))

; 3. the list of basic colors
(cons 'red
      (cons 'blue
            (cons 'yellow
                  (cons 'orange
                        (cons 'green
                              (cons 'violet empty))))))

; Nice sketches of the lists
                     