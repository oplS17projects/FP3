# Final Project Assignment 3: Exploration (FP3)
DUE Sunday, March 26, 2017

##My Library(turtles-graphic)
The purpose of FP3 was to explore another library, however it must be related to our course project. For The second library I chose
I decided to use the turtle-graphics, allowing me to manipulate a "turtle" by inputing commands via source code. The code below does
a simple draw of a star shaped object. It wasn't my intentions at first, I had wanted to use the image-library which would let me use
a sprite image and let me manipulate it's position based on it's (x) and (y) coordinates. However I had to make due and design something
on the spot. 

I digress, continuing it was simple enough to get this library to work the way I wanted it to. Based on the allowed functions I'm able to
move the "turtle" anywhere on and outside of the bounds of the window. 

#Code
```
#lang racket

(require graphics/turtles)

(turtles)
(draw 250)
(turn 215)
(draw 500)
(turn 215)
(draw 500)
(turn 215)
(draw 500)
(turn 215)
(draw 470)
(turn 219.4)
(draw 250)

```
#Output
There's going to be a displayed image of a star for the code.

Star Image:
![star image](/star.png?raw=true "output")


#Closing Thought's
As I mentioned before I originally planned on using the image-library for my FP3, but as it took a while to figure out how to do it, I was 
running out of time to actually get the code to work. Our project goal as you know is to make a Game of some sort, and my partner and I realized
we might have chosen a harder project than we had inticipated. 






