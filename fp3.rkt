#lang racket

(require 2htdp/universe)
(require 2htdp/image)

(define BACKGROUND (empty-scene 100 100))
(define DOT (circle 10 "solid" "green"))
 
(define (main y)
  (big-bang y
    [on-tick sub1]
    [stop-when zero?]
    [to-draw place-dot-at]
    [on-key stop]))
 
(define (place-dot-at x y)
  (place-image DOT x y BACKGROUND))
 
(define (stop y ke)
  0)