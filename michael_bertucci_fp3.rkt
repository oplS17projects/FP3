#lang racket

;; Michael Bertucci
;; OPL Exploration 2
;; 2htdp/image drawing library + 2htdp/universe for making moving images

(require 2htdp/image)
(require 2htdp/universe)

; creating a couple basic shapes
(define circle1 (circle 10 150 "royalblue")) 
circle1

(define shape1 (regular-polygon 30 12 'outline "yellow"))
shape1


; function to create a repeatedly overlayed image, with each iteration 4/5 the size of the previous and rotated 1 degree
(define (spiral-image image count)
  (if (< count 1)
      image
      (spiral-image (underlay image (rotate 1 (scale 0.8 image))) (- count 1))))

; testing the function
(define tri1 (triangle 100 'outline "green"))
(spiral-image tri1 5)
(spiral-image shape1 10)

; testing using the function in an animation
(define square1 (square 500 'outline "red"))
(define (spiral-square1 count) (spiral-image square1 count))
(animate spiral-square1)

; function to move the small circle around the 4 'corners' of the shape counter-clockwise
(define (move-circle time) (let ([r (remainder time 4)])
                              (cond ((= r 0) (overlay/align "right" "top" circle1 shape1))
                                    ((= r 1) (overlay/align "left" "top" circle1 shape1))
                                    ((= r 2) (overlay/align "left" "bottom" circle1 shape1))
                                    (else (overlay/align "right" "bottom" circle1 shape1)))))
(animate move-circle)