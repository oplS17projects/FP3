# FP3: Final Project Assignment 3: Exploration 2
## Library Name
My name: Steve Kim 

Library: web-server/servlet
http://docs.racket-lang.org/web-server/run.html

I explored the web-server library specifically the servelet part.  This will be used to display our magic mirror.  As an experiment I made a [local] webpage. The webpage is fairly basic composed a title, a header, text, a picture and a hyperlink.  
Both the portnumber and hyperlink suffix can be tailored as needed.  There is as well an option for an external conneciton to the website could be made. I was able to as well center the main components of the webpage and will have to conintue to look at other ways to format (spatially position) text, hyperlinks and images.  Once you hit "Run" in Dr. Racket the webpage would open in the default browswer (Mozilla for me).  All of the output is demonstrated in the screenshot that is at the bottom.  
One of the things that I learned is that html (via Racket) will only output strings.  Luckily there is a funciton that converts numbers to strings. 
```racket
(define test_list '("Lowell, MA", "Dayton, OH", "Portland, OR", "Camden, ME")); random places in 'MURICA 
(define test_list2 '(5, 3, 1)) ; test outputting numbers 
(define second (car test_list2)) ; should get the number 5
(define first( car test_list)) ; should get Lowell, MA 
(define (start req); start is a function that takes a request 
  (response/xexpr
   `(html (head (title "Magic Mirror")); this is the title of the webpage tab 
          (body
           (center(h1 "This is supposed to be a mirror.")); this prints out a header 
           (center "Weather in Lowell"); this prints out a new paragraph of text 
          (center(img ([src "test.jpg"]))) ; this prints out an image 
          (br) 
          (center(h3, first) ; prints out from a list
          (br)
          (center(h4, (number->string second))); prints out number that gets converted to a string so it can be displayed
          (center '(a ((href "https://www.google.com/search?q=lowell+weather&ie=utf-8&oe=utf-8")) "Lowell Weather")); puts in a hyperlink titled Lowell Weather,
          ; the a stands for an anchor 
           )))))
```
![Webpage](Final.png)
