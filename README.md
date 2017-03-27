Slideshow / Math
My name: Thaddeus Ciras

My plan was to look at the racket math library to get an idea for how to do the colissions between the ball and the cars.
It turns out, all of the functionality you would need is built in to the main part of racket.

* angles - for colissions with objects
* pi - for dealing with the circular ball

For this reason I drifted away from the math library and started looking for visual libraries.
I came across slideshow, which does some of the things I want, but in the wrong way.  I still used it as my main liprary as
I'm turning this in late, but I know what better to look for now.

The slideshow library creates very simple images in the active window.  For example, typing
```racket
(circle 10)
```
returns a circle with radius 10 pixels
![circleimage](circle.png)
