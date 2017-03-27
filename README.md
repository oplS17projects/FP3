# Final Project Assignment 1: Exploration (FP1)

## My Library: 2htdp/image 2htdp/universe
My name: Christopher Munroe

I made a simulator for 2D balls to bounce around in a small window. It uses 2htdp to render the animation. Most of my code is organized into two objects, MakeBall and MakeBallHouse. The ball house object symbolizes the larger encapsulating object which contains a list of balls and the dimensions of the space. The Ball object contains simple (x, y) location information and (x, y) velocity component vectors.

The heart beat of the program: 
```
(big-bang 0 ; initial tick value (unused)
          (on-tick (ballHouse 'update))
          (to-draw (ballHouse 'render))
          (stop-when (lambda (x) #f)))
``` 
big-bang function repeatedly calls update on the ballHouse. The update function of ballHouse recursively calls the update function for each ball. Each ball's update function updates the x-pos by doing x-pos += x-velocity. If that resulting coordinate is out of bounds, it inverts the x-velocity and tries again. The same goes for the y-coordinate. 
the ball update calls update-y and update-x which look like: 
```
(define (update-x)
    (begin
      (if (or (< (- (+ x xVel) radius) 0) (> (+ x xVel radius) SCENE-WIDTH))
        (set-xVel (* -1 xVel)) 0)
      (set-x (+ x xVel))))
```


Write what you did!
Remember that this report must include:

* a narrative of what you did
* highlights of code that you wrote, with explanation
* output from your code demonstrating what it produced
* at least one diagram or figure showing your work

The narrative itself should be no longer than 350 words. 

You need at least one image (output, diagrams). Images must be uploaded to your repository, and then displayed with markdown in this file; like this:

![Image of simulation](/myimage.png?raw=true)

You must provide credit to the source for any borrowed images.

Code should be delivered in two ways:

1. Full files should be added to your version of this repository.
1. Key excerpts of your code should be copied into this .md file, formatted to look like code, and explained.

Ask questions publicly in the email group.

## How to Prepare and Submit this assignment

1. To start, [**fork** this repository][forking]. 
  2. (This assignment is just one README.md file, so you can edit it right in github)
1. Modify the README.md file and [**commit**][ref-commit] changes to complete your report.
1. Add your racket file to the repository. 
1. Ensure your changes (report in md file, and added rkt file) are committed to your forked repository.
1. [Create a **pull request**][pull-request] on the original repository to turn in the assignment.

<!-- Links -->
[schedule]: https://github.com/oplS17projects/FP-Schedule
