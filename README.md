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

## 2htdp/universe
My name: Jacob Phillips

I played around with the library for a while. I looked around the internet to teach myself how to use it. In the ended up with something similar to an example I found that uses big-bang to place a dot at a spot of your choosing.
`
#lang racket

(require 2htdp/universe)
(require 2htdp/image)

(define BACKGROUND (empty-scene 100 100))
(define DOT (circle 10 "solid" "green"))
 
(define (main y)
  (big-bang y
    [on-tick sub1]
    [stop-when zero?]
    [to-draw place-dot-at]
    [on-key stop]))
 
(define (place-dot-at x y)
  (place-image DOT x y BACKGROUND))
 
(define (stop y ke)
  0)
`
Remember that this report must include:

* a narrative of what you did
* highlights of code that you wrote, with explanation
* output from your code demonstrating what it produced
* at least one diagram or figure showing your work

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
