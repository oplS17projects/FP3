## rash and 2htdp/image
My name: Benjamin Mourad

I decided to expand on my FP1 submission this week.

Using `rash` and `mpg123` package for Debian, I modified my code to
play a selected MP3 file using the Linux shell.

The following function is based on the previous `get-album` procedure.
Our needs are simple: get the path to the song we want to play.
```
; get the path to our song
(define (get-song-path lst artistname albumname songname)
  (filter (lambda (p)
            (and (string-ci=? (album (read-id3 p)) albumname)
                 (string-ci=? (artist (read-id3 p)) artistname)
                 (string-ci=? (song (read-id3 p)) songname)))
          lst))
```

And we can very simply pass on our desired information to the shell.
```
; replace with your desired artist, album, and song name
(define songpath (car (get-song-path myfiles "BONES" "Rotten" "Rotten")))
(define songpath-s (path->string songpath))
(rash "mpg123 $songpath-s")
```

Additionally, I wanted to display the corresponding album cover.

We start with a predicate for when we invoke `find-files`:
```
(define (coverpred p)
  (define ps (path->string p))
  (or (string-suffix? ps ".png") (string-suffix? ps ".jpg") (string-suffix? ps ".jpeg")))
```
```
; list of images, typically web releases contain at least one image file
; this file is the album cover
(define myimgs (find-files coverpred mypath))
```

After that, we convert to bitmap and scale it down to 200px by 200px:
```
; assume that the first image in the list is our album cover
(define cover (bitmap/file (car myimgs)))
(define cover-h (image-height cover))
(define cover-w (image-width cover))
(define factor-x (/ 200 cover-w))
(define factor-y (/ 200 cover-h))

; display the album cover
(place-image (scale/xy factor-x factor-y cover) 100 100 (rectangle 200 200 "solid" "gray"))
```

And that's all there is to it. An interesting thing to note is that the
length of the song is displayed in the output of `mpg123`. Very nice.

![test image](/testimage.png?raw=true "test image")
