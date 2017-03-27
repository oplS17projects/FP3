## (teachpacks/racket-turtle)
My name: Tim Larocque

#### My Thought Process

After testing out the ```(graphics/turtles)``` last time, I found that it was
rather lackluster in its drawing capabilities. I wanted to continue on the path
of drawing images, so I decided to go with this library. After reading through
the commands that the library uses, I confronted the examples that were given
and decided to play around with the spiral image example.

#### The Core of the Code
```racket
(define (spiral x w a times)
  (if (<= times 0)
      empty
      (cons (side x w a)
            (spiral (+ x 5)
                    (+ w 1)
                    a
                    (sub1 times)))))
```

The above code builds the list of commands that the draw function will use to
draw the spiral to the screen. "side" is a list of commands that will draw a
segment of the spiral to the window. I decided to play around with the input
parameters to "spiral" and choose various angles to see what kind of spiral
would be produced.

#### Outputs with Their Function Calls
```racket
(define spiral-image0 (list (change-color COLORS)
                            (spiral 1 1 45 45)))
```
![spiral0](/spiral0.png?raw=true "spiral0")

```racket
(define spiral-image (list (change-color COLORS)
                           (spiral 1 1 30 30)))
```
![spiral](/spiral.png?raw=true "spiral")

```racket
(define spiral-image2 (list (change-color COLORS)
                            (spiral 1 1 50 40)))
```
![spiral2](/spiral2.png?raw=true "spiral2")

```racket
(define spiral-image3 (list (change-color COLORS)
                            (spiral 1 1 70 40)))
```
![spiral3](/spiral3.png?raw=true "spiral3")
