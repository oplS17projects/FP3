## Library (rsound:fp3), previously used 2htdp Universe/image
My name: Danny Nguyen


## What I did:

In fp1 I explored the 2htdp Universe and Image libraries in hopes of making a side scrolling shooter game. I thought that it would be nice if I could include some background music and add sounds related to the player actions like jumping and shooting etc. So I chose to work with the rsound library. In fp3 I did something simple, building on fp1. Whenever a user hits the "up" arrow the star image will enlarge and play a audio file linked to it, same with when the "down" arrow is pressed the image will shrink and an audio file will be played. This is simple, but similar to how I will link it 
to actions such as the ones mentioned before. Looking foward I intend to explore these two libraries more in depth and produce and actual prototype of the game.

### Code written while exploring:

The definitions show the path to where the .wav audio files are located.
rs-read will read in the .WAV file from the path and return an rsound.
play procedure that will play the given audio file when either arrows are pressed.

``` scheme
#lang racket
(require 2htdp/image)
(require 2htdp/universe)
(require rsound)

(define music "/Users/dannynguyen/Desktop/OPL/Project")
(define sound1 (build-path music "E-Mu-Proteus-FX-909-Kick.wav"))
(define sound2 (build-path music "Dry-Kick.wav"))


(define rsound1 (rs-read sound1))
(define rsound2 (rs-read sound2))

(define (draw-star n)
  (overlay (star n "solid" "red") (empty-scene 500 500)))

(define (change w a-key)
  (cond
    [(key=? a-key "up")(play rsound1)(+ w 10)]
    [(key=? a-key "down")(play rsound2)(- w 10)]
    [else w]))

(big-bang 50
          (to-draw draw-star)
          (on-key change))
```

## Image output: Same images submitted previously, can't really show the sounds working.

<img src="https://github.com/dannynguyen1/FP1/blob/master/Initial.png" width="200" height="200">

<img src="https://github.com/dannynguyen1/FP1/blob/master/After%20pressing%20up%20arrow.png" width="200" height="200">

<img src="https://github.com/dannynguyen1/FP1/blob/master/After%20pressing%20down%20arrow.png" width="200" height="200">

rsound 1: http://freewavesamples.com/dry-kick
rsound 2: http://freewavesamples.com/e-mu-proteus-fx-909-kick



