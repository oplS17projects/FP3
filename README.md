
# mode-lambda
My name: Anthony Voloshin

# Introduction
Although I have minimal experience in game design, I have played many video games over the years and I think I can apply my experience with different games to this project and create one myself (*with the help of my partner*). 

That being said, I chose to explore the mode-lambda library because it allows for the use of sprite manipulation to acheive SNES-like graphics.

# Getting Started
The [documentation page](http://docs.racket-lang.org/mode-lambda/index.html) was fairly detailed, so it was easy to install the package and use it right away. I just wrote 
```
#lang  racket
(require mode-lambda
         mode-lambda/static
         mode-lambda/color
         mode-lambda/backend/software)
```
and that allowed me to use the library's functions.

# Tests
I began testing the library's functionality by creating a sprite database and populating it with sprites, like so:
```
; Makes a sprite database to work with
(define test-db (make-sprite-db))

; Adds test sprites to the existing sprite database
(new-add-sprite!/file test-db 'test-sprite1 "Desktop\\OPL Project\\Graphics Exploration\\dolphin.bmp")
(new-add-sprite!/file test-db 'test-sprite2 "Desktop\\OPL Project\\Graphics Exploration\\ball.bmp")
```
