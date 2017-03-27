## My Library:  (require  2htdp/image)
My name: Brett Lundy

What I did:

For this assignment, I used the  2htdp/image library to test out the differnent kind of images I could  personally make. I really enjoyed this library, because unlike the turtles library I could draw and fill images, and there were many predefined functions that allowed me to easily draw things that i couldn't in the turtles library. I was also able to use some methods we learned in class, like making a list of objects and I managed to use foldl as well:
```racket
(define (make-shape-list shape rad md col)
  (if (<= rad 0)
      '()
      (cons
       (shape rad md col)
       (make-shape-list shape (- rad 10) md col))))

(define shape-list1
  (make-shape-list circle 100 "outline" "red"))

(define (foldl-circle shape-list)
  (foldl (lambda (a result) (underlay result a))
         (circle 0 "outline" "red")
         shape-list1))
```
![test image1](/test-save2?raw=true "Target")

After I was done applying what we've done in class to my library I tryed using some of the predefined functions in my library to make the racket logo. I tried a few different things but ended up drawing the logo like this:
```racket
(define background1
  (rectangle 150 300 "solid" "red"))

(define background2
  (rectangle 150 300 "solid" "blue"))

(define real-background
  (overlay/offset background1 150 0 background2))

(define circle-logo
  (add-line
   (scene+curve
    (circle 150 "outline" "black")
    50 40 0 1/3
    250 260 0 1/3
    "white")
   48 260 150 150 "white"))

(define racket-logo
  (overlay circle-logo real-background))
```
![test image2](/test-save.jpg?raw=true "Racket logo")

Even though it was redundant I made my own little save function, mostly because the already defined save function allows one to give a high tand width and i wanted to stay away from that:
```racket
(define (save-the-image image filename)
  (save-image image filename))
```
