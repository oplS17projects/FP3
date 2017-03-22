# FP3: Final Project Assignment 3: Exploration 2<br>
Due Sunday, March 26, 2017<br>
<br>
<br>
## Icons<br>
My name: Derek Ross<br>
My Email: Derek_Ross@student.uml.edu <br>
My Github: https://github.com/DerekR0123 <br>
Where to Find Code: This repository (FP3) located in the above github. <br>
<br>
Why I chose Icons:
I chose Icons because I feel like it is a great library that can work well with other libraries or on its own to create some awesome idea's. I have a few idea's that I planned on pitching to my partner and professor and they all can benefit from icons:<br>
<br>
Idea 1: The first idea was to make a website using the html library in racket and then continue it with custom icons that turn this webpage into a portfolio for my work at uml. Each Icon could take you to a seperate portfolio understudy, example of my work, github,
or even another website me or my partner has created! All wrapped in a lovely program that we also created!<br>
<br>
Idea 2: The second idea was to make a DJ system using a seperate music library that allows the buttons to extend to mp3 files! I could create a few icons that can play different songs and make a small version of a DJ booth! Im not sure to the extent of altering the music but I could definitly have it cycle through a play list and possibly a cool UI!<br>
<br>
Idea 3: I honestly was to make an ATM. I was very interested in the whole bank system thing we were working on in class. I wanted to extend it and make a real big proper bank system with its own UI and buttons to do each task. I think it would be very cool to have a full ATM machine UI and actions to go with it!. <br>
<br>
<br>
Okay enough explaining why I chose Icons!!! Now for What I did:<br>
<br>
I first researched a few things about the icons and what you can do with them. The icons are basically a representation of a picture
that can be altered and rendered with all sorts of elements. They can have their color, material, size, dimensions, and rendering all altered by commands included in the library! There also are sub libraries that contain different icons you can work with as templates.I took a few of there basic code examples and broke down each peice and explained what It did to show my understanding of the library. I then took some further examples and altered then to show my understanding of the control and manipulation you possess on the items it contains. Lastly I went and found some real world examples to give a better example of why it could be a useful thing to have. <br>
<br>
Something I learned from this was that the icons used to run and stop racket's compiler come from this library too!<br>
<br>
Below is a snippet of a small sample of the code:<br>
<br>
```
;;Allows us to access the different keywords / items in the library such as bitmap
> (require pict images/icons/control images/icons/style)
;;The type of picture we are going to make is a bitmap
> (pict->bitmap
   ;;We are putting a picture object inside of another picture object
   (cc-superimpose
    ;;This code controls the circle on the outside of the arrow for the first icon!
    (bitmap (record-icon #:color "blue" #:height 100
                         ;;As you can see you can control the color, height (size) , and material of the icon
                         #:material glass-icon-material))
    ;;This next set of code is for the arrow contained inside of the previous icon object.
    (bitmap (step-icon #:color light-metal-icon-color #:height 48
                       #:material metal-icon-material))))
                       
```
<br>
<br>

****************************** END OF CODE SAMPLE **************************************<br>
<br>
<br>
   That is just a small snippit of the code with some comments. You can find the full source in this repository. Here is what
   the output result of the code looks like:<br>
   <br>
   <br>
  <img src="https://gyazo.com/e3f9ba667e62496f9ce3895f38905fa3.png" width="15%"></img>
   <br>
   <br>
   <br>
   A Diagram for the library can be found below:
   <br>
   <br>
  <img src="https://gyazo.com/1311ae8d1be10d6382dda08ffac9807b.png" width="15%"></img>
   <br>
   <br>
   <br>
   ##End Of Document##

