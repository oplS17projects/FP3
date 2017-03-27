## 2htdp/universe
My name: Jacob Phillips

I played around with the library for a while. I looked around the internet to teach myself how to use it. I ended up with something similar to an example I found that uses big-bang to place a dot at a spot of your choosing. We are going to be creating a game similar to the original Donkey Kong so we chose to use the 2htdp/image and universe libraries for this.
`
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
`![Place Dot](/Selection_004.png?raw=true "Place Dot")
