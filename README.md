## Turtles
My name: Scott Quinn

Write what you did!
Remember that this report must include:

* a narrative of what you did
* highlights of code that you wrote, with explanation
* output from your code demonstrating what it produced
* at least one diagram or figure showing your work

I enjoyed the plotting library so I wanted to pick another that had to do with drawing or something to that nature. I picked turtles because it seems simple yet intuitive. I started off with the most basic function. Make the turtle draw a line 30 pixels long.
```racket
#lang racket

(require graphics/turtles)
(turtles)

(draw 30)
```
![a](/a.jpg?raw=true"a")
Then I tried turning it.

```racket
(turn/radians (/ pi 2))
(draw 100)
```

![turn](/turn.jpg?raw=true"true")


I then split the turtle into multiple parts
```racket
(split (turn/radians (/ pi 2)))
(split (turn/radians (/ pi 2)))
(split (turn/radians (/ pi 2)))

(draw 10)
```
I noticed how the draw command affected all of the turtles so I kept calling the turn and draw commands in the REPL.

![1](/1.jpg?raw=true"1")

So I made a function that could do that instead of doing repeated calls manually.
```racket
(define (fract n c)
  (fract-iter n 0 c))
(define (fract-iter length count mcount)
  (if (> count mcount)
      count
      ((turn (random 360))
       (draw (random length))
       (fract-iter length (+ count 1) mcount))))
```
![2](/2.jpg?raw=true"2")
![3](/3.jpg?raw=true"3")
![4](/4.jpg?raw=true"4")
![5](/5.jpg?raw=true"5")

I enjoyed the symmetry of the pictures and decided that was enough.
