#lang racket
(require 2htdp/universe 2htdp/image rsound)

; The code for my-signal and scrobble can be found at https://docs.racket-lang.org/rsound/index.html
; 17 Sample Code
; scrobble: number number number -> signal
; return a signal that generates square-wave tones, changing
; at the given interval into a new randomly-chosen frequency
; between lo-f and hi-f
(define (scrobble change-interval lo-f hi-f)
  (local
    [(define freq-range (floor (- hi-f lo-f)))
     (define (maybe-change f l)
       (cond [(= l 0) (+ lo-f (random freq-range))]
             [else f]))]
    (network ()
             [looper <= (loop-ctr change-interval 1)]
             [freq = (maybe-change (prev freq 400) looper)]
             [a <= square-wave freq])))
(define my-signal
  (network ()
           [a <= (scrobble 4000 200 600)]
           [b <= (scrobble 40000 100 200)]
           [lpf-wave <= sine-wave 0.1]
           [c <= lpf/dynamic (max 0.01 (abs (* 0.5 lpf-wave))) (+ a b)]
           [b = (* c 0.1)]))
 
; text
(define stop-text (text "Press [a] to play a randomly-chosen frequency. 
Press [p] to play Beethoven Symphony 5. Press [s] to stop." 16 "blue"))

; scene drawing
(define (render y)
  (underlay/xy (overlay(beside
                (bitmap "up.png")
                (bitmap "right.png")
                (bitmap "down.png")
                (bitmap "left.png"))
                (bitmap "music-back.jpg")) 20 200 stop-text))
  
; reads the musics
(define a (rs-read "/home/emmanuel/Desktop/Final-P/FP3/Beethoven_5th_Symphony.wav"))

; define key
(define key-p "p")

; handle input
(define (handle-key n key)
  (cond
    ; play the signal
    [(key=? key "a") (signal-play my-signal)]
    ; stop 
    [(key=? key "s") (stop)]
    ; play the song
    [(key-event? key-p) (play a)]
    [else n]
    )
)

; scene initialization
(big-bang 0
          (on-key handle-key)
(to-draw render))