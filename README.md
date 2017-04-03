# FP3: Final Project Assignment 3: Exploration 2
Due Sunday, March 26, 2017

This assignment is the same as [FP1], except definitely choose a library that you expect to use for your full project.

You will be in your team before you complete this assignment. You and your teammate(s) must coordinate to (1) both choose libraries relevant to your project, and (2) each choose a different library.

The report template is below, beginning with "Library Name Here."

## How to Prepare and Submit This Assignment

1. To start, [**fork** this repository][forking]. 
1. Add your `.rkt` Racket source file(s) to the repository. 
1. Add any images to the repository.
1. Modify the `README.md` file and [**commit**][ref-commit] changes to complete your report.
1. Ensure your changes (report in `md` file, added `rkt` file(s), and images) are committed to your forked repository.
1. [Create a **pull request**][pull-request] on the original repository to turn in the assignment.

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
Then I tried turning it.

```racket
(turn/radians (/ pi 2))
(draw 100)
```
I then split the turtle into multiple parts
```racket
(split (turn/radians (/ pi 2)))
(split (turn/radians (/ pi 2)))
(split (turn/radians (/ pi 2)))

(draw 10)
```
I noticed how the draw command affected all of the turtles so I kept calling the turn and draw commands in the REPL.

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

I enjoyed the symmetry of the pictures and decided that was enough.
The narrative itself should be no longer than 350 words. 

You need at least one image (output, diagrams). Images must be uploaded to your repository, and then displayed with markdown in this file; like this:

![test image](/testimage.png?raw=true "test image")

You must provide credit to the source for any borrowed images.

Code should be delivered in two ways:

1. Full files should be added to your version of this repository.
1. Key excerpts of your code should be copied into this .md file, formatted to look like code, and explained.

<!-- Links -->
[FP1]: https://github.com/oplS17projects/FP1
[schedule]: https://github.com/oplS17projects/FP-Schedule
[markdown]: https://help.github.com/articles/markdown-basics/
[forking]: https://guides.github.com/activities/forking/
[ref-clone]: http://gitref.org/creating/#clone
[ref-commit]: http://gitref.org/basic/#commit
[ref-push]: http://gitref.org/remotes/#push
[pull-request]: https://help.github.com/articles/creating-a-pull-request
