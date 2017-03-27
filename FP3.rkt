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





