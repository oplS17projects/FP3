#lang slideshow

;; In order to see the ball, we need to have some sort of
;; graphical reperesentation
(define (myBall r)
  (circle r))

;; The documentation gives these functions for creating a checkerboard.
;; Creates square - a rectangle with equal side lengths and solid fill
(define (square s)
  (filled-rectangle s s))

;; Puts four of an object in a square formation
(define (four p)
  (define two-p (hc-append p p))
  (vc-append two-p two-p))

;; Alternales colors to create checker-board pattern
(define (checker p1 p2)
  (let ([p12 (hc-append p1 p2)]
        [p21 (hc-append p2 p1)])
    (vc-append p12 p21)))

;; Creates checker board of standard sixe (8 x 8)
(define (checkerboard n)
  (let* ([gp (colorize n "gray")]
         [bp (colorize n "black")]
         [c (checker gp bp)]
         [c4 (four c)])
    (four c4)))

