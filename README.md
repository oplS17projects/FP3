My second exploration is on the 2htdp/image and 2htdp/universe libraries.

the image library alone is not particularly usefull on its own but it has some purpose.

there are many simple procedures in the library such as the circle and rectangle procedures that are easy to use. typing in the following code can give an expected result
```(racket)
(circle 5 "solid" "red")
```

fig1_2

the images are placed directly in the command line, not particularly usefull, but it leads into more uses with the universe libraries.

A simple procedure they have for testing and such is the animate procedure. The arguments for the procedure are another procedure that takes a simple natural number and outputs a shape. Animate will create a window to display the animation of the shape as the input increases starting at 0
```(racket)
(define (funky_circle n)
  (circle (- 300 n) "solid" (if (eq? (modulo n 2) 0) "red" "blue")))
(animate funky_circle)
```

fig2_2

creates a screen 300x300 pixels of a circle with slowly decreasing radius and flashing blue and red

The universe library allows for more direct control over such drawings with uses of states. The big-bang procedure takes an initial state (state meaning a piece of information passed between procedures) and what to do for several cases such as a procedure that says how to draw the world, a procedure that says what to do at each interval and so on. The two procedures I primarly messed around with were to-draw and on-tick

to-draw takes a procedure and (optionally) two natural numbers and this will make it so whenever the world needs to draw it's self, it will run the procedure it was given, on the current world state (so the procedure given to to-draw needs to accept the world-state as an argument)
on-tick takes a procedure and will run the procedure given to it on every clock tick, updating the world state with the return value of that procedure.
