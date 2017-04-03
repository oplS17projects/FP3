## Turtle Graphics
My name: Henry Walker

I explored the turtle graphics library. Since my partner and I will likely be making a 2048 type game, I figured I should check out a graphics library to guide our game. I basically set up the inital game board and created some squares inside the board
This was done mostly through using turn and forward to make the blue squares and a function from the library to make the board. Managing the actual turtle was alot harder than I was expecting. The window refreshes very fast so its quite difficult to keep track of the turtles direction and current position. I am currently unsure of whether I will use this specific graphics library due to this problem. However, there might be a way to manage the refresh speed and I can continue experimenting with creating squares from a fixed point, which would make my move functions much more consistent.

```
  (define coordinate-square
      (list (set-origin)
            (pen-up)
            (go-to -5 25)
            (pen-down)
            (go-to -5 125)
            (go-to -105 125)
            (go-to -105 25)
            (go-to -5 25)))
```

This is my favorite peice of code, it took me a really long time to get the specific coords to make the center square
I liked this type of square alot cause theoretically I could just make a function to transform the points, but it ended up being alot more complicated than that so I went with the turn and forwards instead. It also had a little tail when it was created due to it creating a line from the origin point to the first point. This was very confusing at first because I would plot 4 points and find 5.

![turtle image](/turtleboard.png?raw=true "turtle board")


<!-- Links -->
[FP1]: https://github.com/oplS17projects/FP1
[schedule]: https://github.com/oplS17projects/FP-Schedule
[markdown]: https://help.github.com/articles/markdown-basics/
[forking]: https://guides.github.com/activities/forking/
[ref-clone]: http://gitref.org/creating/#clone
[ref-commit]: http://gitref.org/basic/#commit
[ref-push]: http://gitref.org/remotes/#push
[pull-request]: https://help.github.com/articles/creating-a-pull-request
