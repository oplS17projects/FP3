# FP3: Final Project Assignment 3: Exploration 2
Due Sunday, March 26, 2017

## My Library: 2htdp/image (and a little bit of 2htdp/universe)
My name: Michael Bertucci

I did a test run of the Image library to learn how to draw shapes in Racket, and integrated this knowledge into the `animate` function from the Universe library. The purpose was to learn how to make objects move around on-screen, as the project my partner and I are planning will involve doing this.

The first thing I did was create a couple basic shapes - a small, semi-transparent circle and a larger, yellow-outlined 12-sided polygon.
```racket
(define circle1 (circle 10 150 "royalblue"))
(define shape1 (regular-polygon 30 12 'outline "yellow"))
```

I wanted to write a function that could create a more complex image from a simple one, so I devised this function that creates a "spiral" pattern by repeatedly overlaying the image with a slightly rotated, slightly smaller version, using the `underlay` and `scale` functions from the Image library.
```racket
(define (spiral-image image count)
  (if (< count 1)
      image
      (spiral-image (underlay image (rotate 1 (scale 0.8 image))) (- count 1))))
```

I tested this function with the yellow polygon from above as well as a new triangle `(define tri1 (triangle 100 'outline "green"))`. The results of all the images so far looked like this:

![REPL output](/output.png?raw=true)

The next step I took was to experiment with animating this spiral effect. The `animate` function is part of 2htdp/universe. Since it requires a function that only takes a single integer as an argument, I created a wrapper for my `spiral-image` function that only required the count argument, and applied spiral-image to a test shape I defined.
```racket
(define square1 (square 500 'outline "red"))
(define (spiral-square1 count) (spiral-image square1 count))
(animate spiral-square1)
```

![animation output](/animation1.png?raw=true)

This launches a separate window that displays the animation. Unfortunately, my function wasn't optimized very well and the animation quickly starts to lag, because for each time it redraws it has to recreate all the previous iterations in addition to the current one. If you let it run too long the close button on the window may not respond and it may require clicking the stop button in DrRacket to break it out of its execution.

Lastly I wanted to see if I could make an object move around another object, so I wrote a function using my circle and 12-sided shape
that would make the circle jump around the shape counter-clockwise, making use of the Image library's alignment mechanism.
```racket
(define (move-circle time) (let ([r (remainder time 4)])
                              (cond ((= r 0) (overlay/align "right" "top" circle1 shape1))
                                    ((= r 1) (overlay/align "left" "top" circle1 shape1))
                                    ((= r 2) (overlay/align "left" "bottom" circle1 shape1))
                                    (else (overlay/align "right" "bottom" circle1 shape1)))))
```

![animation output](/animation2.png?raw=true)

In each subsequent frame, the circle moves to the next corner in a counter-clockwise cycle.
