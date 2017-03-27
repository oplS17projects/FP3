#lang racket

(require racket/file)
(require binary-class/mp3)
(require rash)
(require 2htdp/image)

(define nil '())

; replace with the path to your music library
(define mypath (string->path "/home/delysid/Music"))
(define (mypred p) (string-suffix? (path->string p) ".mp3"))
(define (coverpred p)
  (define ps (path->string p))
  (or (string-suffix? ps ".png") (string-suffix? ps ".jpg") (string-suffix? ps ".jpeg")))

; all paths to mp3 files
(define myfiles (find-files mypred mypath))

; list of images, typically web releases contain at least one image file
; this file is the album cover
(define myimgs (find-files coverpred mypath))

; get the path to our song
(define (get-song-path lst artistname albumname songname)
  (filter (lambda (p)
            (and (string-ci=? (album (read-id3 p)) albumname)
                 (string-ci=? (artist (read-id3 p)) artistname)
                 (string-ci=? (song (read-id3 p)) songname)))
          lst))

; assume that the first image in the list is our album cover
(define cover (bitmap/file (car myimgs)))
(define cover-h (image-height cover))
(define cover-w (image-width cover))
(define factor-x (/ 200 cover-w))
(define factor-y (/ 200 cover-h))

; display the album cover
(place-image (scale/xy factor-x factor-y cover) 100 100 (rectangle 200 200 "solid" "gray"))

; replace with your desired artist, album, and song name
(define songpath (car (get-song-path myfiles "BONES" "Rotten" "Rotten")))
(define songpath-s (path->string songpath))
(rash "mpg123 $songpath-s")