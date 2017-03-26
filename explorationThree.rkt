#lang racket/gui

(require racket/draw)
(require net/url)

;; Images in racket are represented as "bitmaps"
;; read-bitmap will create an instance of our image from the URL, as a bitmap
;; This is a random image from our Yelp request from exploration 1.
;; http://docs.racket-lang.org/draw/bitmap_.html
(define image
  (read-bitmap
   (get-pure-port
    (string->url
     "https://s3-media2.fl.yelpcdn.com/bphoto/9s1y1UrSKOZUVG1ebeqvNw/o.jpg"))))

;; Creates a new frame with racket/draw
;; A frame is a top-level container window. It has a title bar (which displays the frame’s label),
;; an optional menu bar, and an optional status line.
(define frame (new frame% [label "Response Image, FP3"]))
;; Evaluates our frame that obtains the image, then uses "show" to display the image, with argument true
(send frame show #t)
;; This instance returns nothing, because we just want to display the image
;; A message control is a static line of text or a static bitmap. The text
;; or bitmap corresponds to the message’s label
(void (new message% [parent frame] [label image]))