# FP3: Final Project Assignment 3: Exploration 2
Due Sunday, March 26, 2017

## web-server/insta
My name: Sohit Pal

My OPL Project is to create a webpage that allows users to enter in a few of the food items that they have, and be given some recipes that they can make with said food items.

I used web-server/insta because it seemed like a good way to run and design the website to allow for customer-friendly UI.

To get the webpage up and running:

'''racket
(define (start request)
  (response/xexpr
   '(html
     (head (title "Racket Webpage"))
     (body
      (center (h1 "This page was made in Racket!"))
      (p  "Defaults to left align...")
      (p (a ((href "http://www.google.com/")) "Here") " is a link to Google!")
      (img ((height "500px") (src "http://www.directsportseshop.co.uk/Images/ExtraLarge/head_ti_s6_tennis_racket_black.jpg")))))))
'''

This code sample shows the basic syntax used to add elements to the page, and syntax for providing parameters to idividual elements (such as with the img tag).

![racket webpage image](/racketWebpage.png?raw=true "excel spreadsheet image")

The image above is the output of the shown code.

(image of the racket was found at : http://www.directsportseshop.co.uk/)
