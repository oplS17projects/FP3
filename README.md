# FP3: Final Project Assignment 3: Exploration 2
## racket/gui
My name: Mohammed Nayeem

In this exploration I chose to look at the GUI library. At first I thought the library was insanely packed with content and couldn't really understand it too much but I continued with it. From the GUI library I went with a canvas. This allowed me to draw within the canvas in a certain order. I was playing around with the code and tried to add a text field in just by playing around with it and it somehow was creating the text field over and over again. I still haven't figured out how that happened but I believe this library constantly updates the canvas. This could be why there a lot of text fields when I messing around with code.

In the beginning of the code I create the frame: 
```
(define frame (new frame%
                   [label "FP3 - Rackman"]
                   [width 600]
                   [height 600]))
```

This pretty much names it FP3 - Rackman and sets the height and the width to 600x600.

The next piece of code just brings the pacman image into program:
```
(define pacImage (read-bitmap "/home/mohammed/Desktop/pacman.jpg"))
```
pacImage is an image of Pacman.

Alright, let's get to the meat of the program:

```
(new canvas% [parent frame]
             [paint-callback
              (lambda (canvas dc)
                (send dc set-scale 2 2)
                (send dc set-text-foreground "blue")
                (send dc draw-text "Welcome to Rackman" 60 0)
                (send dc draw-bitmap pacImage 35 35)
                (send dc set-scale 1.5 1.5)
                (send dc set-text-foreground "red")
                (send dc draw-text "Press Any Button to Continue" 90 370))])
```

This creates a canvas which contains a lambda that just creates the labels and calls the image to show at a certain position on the canvas. 

The last line:
```
(send frame show #t)
```
This shows everything :D

This is the final result:
![GitHub Image](pacman.png?raw=true "Pacman")




Credits: 
https://upload.wikimedia.org/wikipedia/en/2/28/Pac-Man_character_art_-_The_Adventure_Begins.png
