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

## 2htdp/image
My name: Kelly Stilson

I explored the 2htdp/image library.
We will be using this library to design and manipulate(somewhat) images, backgrounds, and items in our game.
I took this as an opportunity to begin work on main character in our game, which at this point is a Narwhal, tentatively named Walley.

I chose to design him in pieces instead of just use a bitmap so that we can change how he looks easily. He has moods, right now its just happy and sad, but we will be expanding it to dead and winning.
![capture1](/capture1.PNG?raw=true "Moody Walley")
![capture2](/capture2.PNG?raw=true "Moody Walley")

I also made it so that he an go in differnt directions, although at first I made it more complicated than it needed to be, by rotating the objects he is made out of first, and then placing them all together, but then I realized I could just put him together and THEN flip him horizontally.

![Capture](/Capture.PNG?raw=true "Programm Output")

This will be utilized in our game when the player makes him move left and right.

