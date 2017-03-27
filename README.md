# Final Project Assignment 3: Exploration (FP3)

## My Library: opengl
My name: Christopher Munroe

(I was struggling and I figured this is exploration so I found gl-frame.rkt online to get through some nitty gritty stuff and that is NOT my code)

(main.rkt IS my code.)

With the help of some example code, I made a colored cube that you can rotate with WASD. Once it is configured in the opengl init function, you can render 3d shapes by drawing many triangles (or quads in my case) within an opengl draw function.

Within my on-draw function ```draw-opengl``` firstly we shift the origin of our drawing so it is infront of the camera, rather than inside of it by calling: 
``(glTranslated 0 0 -5)`` 

Next, we rotate our environment according to some global variables (which are altered by WASD keystrokes): 

```
(glRotated *xrot* 1 0 0)
(glRotated *yrot* 0 1 0)
(glRotated *zrot* 0 0 1)
``` 
 
Then we start drawing the sides of the cube, each side is defined like this: 
```
(glBegin GL_QUADS)
          (glColor3f 0 1 0)     ; specified the color with RGB, where each value's range is 0->1
          (glVertex3f  1 1 -1)  ; which makes this color green
          (glVertex3f -1 1 -1)
          (glVertex3f -1 1  1)  ; Then, because we are defining within a GL_QUAD, 
          (glVertex3f  1 1  1)  ; we specify 4 vertices to make-up a rectangle.
          ...
```

The rotation variables are mapped to the keystrokes here: 
```
(add-key-mapping #\w (lambda () (set! *xrot* (+ *xrot* 5))))
(add-key-mapping #\s (lambda () (set! *xrot* (- *xrot* 5))))
(add-key-mapping #\a (lambda () (set! *yrot* (+ *yrot* 5))))
(add-key-mapping #\d (lambda () (set! *yrot* (- *yrot* 5))))
``` 

The example file that I have used from an online source (``gl-frame.rkt``) initialized the 
canvas to draw on and provided the ``add-key-mapping`` function. I would have liked to do this file myself, 
but I ran out of time and compromised.

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
