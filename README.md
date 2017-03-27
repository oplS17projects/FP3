
## My library: 2htdp/image
My name: David Caizzi

For our project, we're making a game so I decided to take a look at another graphics library except this time, I chose one that was a bit more practical than the turtles.
While testing this library, I got a feel for how things were layed out and how a couple key functions worked.

One of the things I made was a smiley procedure. This was useful to me as it gave me an understanding how the coordinate system worked and how to draw curves which ended up being a little tricky.
![Smiley-Face](/smiley.png?raw=true "Smiley Face")

```racket
(define (smiley-face)
  (add-curve
   (overlay/offset
    (circle 20 "solid" "black")
    -35 25
    (overlay/offset
     (circle 20 "solid" "black")
     35 25
     (circle 100 "solid" "yellow")))
   40 130 -45 1/3
   160 130 45 1/3
   (make-pen "black" 15 "solid" "round" "round")))
```
This code overlays two circles over a larger circle and then adds a custom curved line to form the mouth. Nothing super groundbreaking, but I learned a lot about positing things while using overlays.


After using the library for a while, I was still  a little unsure about how I could use all the smaller images to build something bigger. I decided to try to make some type of recursive image and hoped it would clear up some of my confusion.

![Recursive thing](/spirals.png?raw=true "Recursive thing")

```racket
(define (spiral x)
  (if (= x 0) empty-image
      (overlay/align
       (cond ((= (remainder x 4) 0) "left")
             ((= (remainder x 4) 1) "left")
             ((= (remainder x 4) 2) "right")
             ((= (remainder x 4) 3) "right"))
       (cond ((= (remainder x 4) 0) "top")
             ((= (remainder x 4) 1) "bottom")
             ((= (remainder x 4) 2) "top")
             ((= (remainder x 4) 3) "bottom"))
       (spiral (- x 1))
       (circle (* x 20) "solid"
               (cond ((= (remainder x 4) 0) "green")
                     ((= (remainder x 4) 1) "blue")
                     ((= (remainder x 4) 2) "red")
                     ((= (remainder x 4) 3) "yellow"))))))
```
This code recursively draws bigger and bigger circles in alternating corners of the previous circle.
That code is kind a mess and the end goal isn't exactly what I had in mind, but the whole process of making it was actually really helpful. Because I called the function recusively, I learned about how the overlay function behaved and how it evaluated which gives me some sense of how to make a larger project with it.

In the future, I plan on pairing this with the 2htdp/universe library and using them both in the game.
