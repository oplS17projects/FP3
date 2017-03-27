Source code:

```racket
#lang racket

(require racket/gui)
(require 2htdp/universe)
(require (prefix-in htdp: 2htdp/image))


(define bgm1 "nsmb_hurry_up.wav")
(define bgm2 "nsmb_game_over.wav")
(define bgm3 "nsmb_death.wav")

;(play-sound bgm1 #t)
;(play-sound bgm2 #t)

;(play-sound bgm3 #t)


; proto type for looping tracks: this will conti to loop the track.
; I wanted to test for a cont value which would tell you if to continue
; playing music or not but soon realised that wasn't possible since
; I had no way of changing the conition inside the never ending loop.

; If this is to work, I will have to look into while loops. while true play track,
; or something along those lines.

(define (loop track cont)
(play-sound track #f)
(if cont (loop track cont)
(play-sound track #f)))

; makes a track with list of con cells, matching list of name and list of file name.
(define (make-track name file)
(map (lambda (i x) (cons i x)) name file))

; (list 1 2 3)
; (list "nsmb_hurry_up.wav" "nsmb_game_over.wav" "nsmb_death.wav")

; Resulting output...

;(define track-1 (make-track (list 1 2 3) (list "nsmb_hurry_up.wav" "nsmb_game_over.wav" "nsmb_death.wav")))
; track-1
;((1 . "nsmb_hurry_up.wav") (2 . "nsmb_game_over.wav") (3 . "nsmb_death.wav"))

;; actually this makes things complicated for no reason...


; Instead of having a function, I decided to have a music-player device that I could
; continue adding play options to. Also changed loop to take the number of time it wanted
; to play. When it is done playing it will return false, which could then be used to check if
; the music is still playing from outside this function. The music player takes a list of names
; of music files that it can than play.

(define (music-player track)
(define (play name)
(play-sound (first (member name track)) #f) #f)
(define (loop name count)
(if (> count 0) (begin (set! count (- count 1)) (if(pair? name) (playlist name) (play name)) (loop name count))
#f))
(define (playlist list)
(for-each (lambda (name) (play name)) list)#f)
(define (option method)
(cond ((eq? method 'play) play)
((eq? method 'loop) loop)
((eq? method 'playlist) playlist)
(else (error "Unknown option: music player"
method))))
option)

; Test results:

; 

; (define play-1 (music-player (list bgm1 bgm2 bgm3)))
; ((play-1 'loop)bgm1 2)
; #f
; ((play-1 'loop)(list bgm3 bgm1 bgm2) 2)
; #f
; ((play-1 'loop)bgm3 5)
; #f
; ((play-1 'play)bgm1)
; #f
; ((play-1 'play)bgm2)
; #f
; ((play-1 'play)bgm3)
; #f
; ((play-1 'playlist)(list bgm3 bgm1 bgm2))
; #f


;; This is for building the playing field. Not done yet.

(define BLOB-right
(htdp:overlay/offset
(htdp:circle 5 "solid" "black")
-20 10
(htdp:circle 30 "solid" "yellow")))

(define BLOB-left
(htdp:overlay/offset
(htdp:circle 5 "solid" "black")
20 10
(htdp:circle 30 "solid" "yellow")))

(define (create-field height)
(htdp:place-image
BLOB-right
30 height
(htdp:empty-scene 400 400)))

;; (animate create-field)

```

My Library: (require racket/gui) For making a simple music player(needed in our game)

More for getting a head start on the project but couldn't figure out how to 
combine the music and the playing field together just yet.

(require 2htdp/universe)
(require (prefix-in htdp: 2htdp/image))

My name: Jessica Lai

I decided to explore the gui library because I could not download rsound and it was the only
other library that could play music. I knew I need some form of music player in the game that
Jooseppi and I are trying to put together. 

This was tougher than I originally thought because the only function gui provided for playing 
music was play-sound which just plays a sound file. This meant I had to build my own interface.

I first tried to make functions for each action I wanted to implement on a sound file. 

The original loop was implemented in this way but it was flawed in 2 major ways. First of all,
trying to keep looping until a terminating condition was meet doesn't work because it just keeps
on looping without ever reavaluating. Second, it makes more senses, and would be safer
to have an object holding all functions that work with sound.

Then I implemented a simple version of a music player with just the play function. Originally,
I had imagined a track would with a list of con-cells, each holding the name and the filename
of the music. I eventually realised this was redundant since the symbol evaluates to the filename
anyways and I could just use that instead of assigning another name to it.

Music player takes a track(list of soundfiles) and has these functions: 

Play takes a name, finds the corresponding entry in the track and plays it. 

Loop takes a name and a count, and while the count is greater than 0 counts down and plays what 
it is given(a playlist or a single file). 

The playlist walks down the list and plays every element in it.

One feature I added in the player is an return value of #f. This can be helpful in the future if 
I wanted to keep playing music until a certain action because I can check if it is still playing 
from the return value. 

![alt tag](https://github.com/sagishi/FP3/blob/master/music_player.png)


I also tried putting together a playing field so I could run the music in the background but I'm
not really sure how to do it since 2htdp universe doesn't have music and I'm not familiar with it. 
But I did succeed in creating a field with a BLOB and bring up a window for animation. (the default 
falling down)

![alt tag](https://github.com/sagishi/FP3/blob/master/create-field.png)
![alt tag](https://github.com/sagishi/FP3/blob/master/first-animation.png)


<!-- Links -->
[FP1]: https://github.com/oplS17projects/FP1
[schedule]: https://github.com/oplS17projects/FP-Schedule
[markdown]: https://help.github.com/articles/markdown-basics/
[forking]: https://guides.github.com/activities/forking/
[ref-clone]: http://gitref.org/creating/#clone
[ref-commit]: http://gitref.org/basic/#commit
[ref-push]: http://gitref.org/remotes/#push
[pull-request]: https://help.github.com/articles/creating-a-pull-request
