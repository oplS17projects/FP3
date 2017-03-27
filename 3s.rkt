#lang racket
(require teachpacks/racket-turtle)

(define COLORS
  (list "red" "orange" "yellow" "green" "blue" "indigo" "violet" "black"))

(define (side x w a)
  (list (change-pen-size w)
        (forward x)
        (turn-left a)))

(define (spiral x w a times)
  (if (<= times 0)
      empty
      (cons (side x w a)
            (spiral (+ x 5)
                    (+ w 1)
                    a
                    (sub1 times)))))

(define spiral-image0 (list (change-color COLORS)
                            (spiral 1 1 45 45)))

(define spiral-image (list (change-color COLORS)
                           (spiral 1 1 30 30)))

(define spiral-image2 (list (change-color COLORS)
                            (spiral 1 1 50 40)))

(define spiral-image3 (list (change-color COLORS)
                            (spiral 1 1 70 40)))

(draw spiral-image0)
(draw spiral-image)
(draw spiral-image2)
(draw spiral-image3)