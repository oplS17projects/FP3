#lang racket
(require 2htdp/image)
(require 2htdp/universe)
(require racket/trace) ; was trying to use this to debug, nothing seems to write until after the window created by big-bang closes though.
(require rsound)

(define arrowSound (rs-read "arrow.wav"));read in the arrow sound to be played upon shooting
;(play arrowSound)
(define (bubble x y size speed color)
  (define (dispatch comm val) ; couldn't figure out how to do an optional arg (val only needed in update case)
    (cond [(equal? comm 'x) x]
          [(equal? comm 'y) y]
          [(equal? comm 'update-x) (set! x val)]
          [(equal? comm 'update-y) (set! y val)]
          [(equal? comm 'size) size]
          [(equal? comm 'speed) speed]
          [(equal? comm 'color) color]
          [(equal? comm 'draw) (circle size "solid" color)]
          [else (error "bubble: unknown command --" comm)]))
    dispatch)
          
(define (player x y)
  (define (dispatch comm)
    (cond [(equal? comm 'move-left) (if (< x 1) x (set! x (- x 5)))]
          [(equal? comm 'move-right) (if (> x 1490) x (set! x (+ x 5)))]
          [(equal? comm 'position) x]
          [(equal? comm 'shoot) (if (my-hook 'is-shooting?) ;if it's not shot yet, let start shot. otherwise ignore.
                                    (my-hook 'start-shooting)
                                    "currently shooting")] ; will eventually shoot a grappling hook to top of screen. for now it shoots the sprite since I can't figure out how to draw multiple sprites yet.
          [else (error "player: unknown command --" comm)]))
  dispatch)

(define (hook x y shooting) ; will eventually be second object that needs an x and y since it will be shot to pop bubbles
  (define orig-y y) ;save what to reset y value to when it reaches the top of the screen
  (define (dispatch comm)
    (cond [(equal? comm 'x) x]
          [(equal? comm 'y) y]
          [(equal? comm 'is-shooting?) (if (equal? shooting 'no) #f #t)]
          [(equal? comm 'start-shooting) (if (equal? shooting 'no) (begin (play arrowSound) (set! shooting 'yes)) "shooting")] ; need to debug this, if statement doesn't seem to read properly
          [(equal? comm 'stop-shooting) (set! shooting 'no)]
          [(equal? comm 'update) (begin (set! x (p1 'position)) (set! y (- y 10)))]
          [(equal? comm 'reset) (begin (set! y orig-y) (set! shooting 'no))]
          [else (error "hook: unknown command --" comm)]))
  dispatch)
; initialize the main player and the "hook" used (eventually) to pop bubbles
(define p1 (player 0 900))
(define p1-sprite (bitmap "Kirby_Sprite.png"))
(define bluebubble (bubble 0 500 30 3 "blue"))
(define my-hook (hook 50 900 'no))
(define my-hook-sprite (triangle 20 "solid" "red"))

(define background (bitmap "background.jpg"))


;handle key events
(define (change w a-key)
  (cond [(key=? a-key "left") (p1 'move-left)]
        [(key=? a-key "right") (p1 'move-right)]
        [(key=? a-key " ") (my-hook 'start-shooting)]
        [else w]))

(define (update-screen x)
  (underlay/xy background (p1 'position) ; x val
               (- (my-hook 'y) 10) (overlay/offset my-hook-sprite 0 50 p1-sprite)))

(define (update-sprites x) (if (and (my-hook 'is-shooting?) (> (my-hook 'y) 10)) ; if the hook is shooting and it hasn't reached the top of the screen yet
                               (my-hook 'update) ; keep moving it up 10 pixels
                               (my-hook 'reset))) ; reset to original place
(trace hook)
(big-bang 'world0
          (on-tick update-sprites); don't fully understand what this does but it's in the example
          (on-key change) ; check for key events (left, right or space)
          (to-draw update-screen)) ; update sprite (sprites eventually, hopefully