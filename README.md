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

## racket/tcp
My name: Chris Guyott

I used the racket/tcp library to connect to the uml cs server. I also used some related predicates to check the input and output ports and printed the port objects in a list.

'''racket
(define ports (let-values ([(input output) (tcp-connect "cs.uml.edu" 22)])
                (list input output)))
'''
This code segment creates a list of two objects called ports. The first object is the input port and the second is the output port used to interface with the cs server.

![output](/pic.png?raw=true "output")
