Name: Minh Nguyen

Library: picturing-program

For this assignment I decided to take a look at picturing-program, a Racket library that allows you to manipulate and add motion to  images. Since our group project is Virtual Piano, I think this library will fit perfectly for the needs of designing the UI, which includes printing out the PIANO, event handlers to check if any key is pressed and then highlight the corresponding key, that is the basic idea. For the following code, I first defined the image files (piano and arrow) and gave them variable names. Then I format the layout of the piano. To print out the image file, I used the big-bang function, which will create a new world. Inside the function, I added (to-draw) which will output the PIANO, and (on-key) which is the key event handlers in this case. I created the function (key-press) so when the key "arrow down" is pressed, the (move) function will be called and rotate the arrow to be pointing down. When you run this program, the piano image will pop up, and when "down" is pressed, it will replace the PIANO with an arrow and then stop the program.

NOTE: Since I can't add pictures onto my code, when you try to run this, you have to insert the pictures of arrow and piano manually in their corresponding define method. I will have them attached.
```
#lang racket
(require picturing-programs)

(define arrow *insert pic here*)
(define PIANO *insert pic here*)
(define PIANO2
  (overlay/align "left" "top" PIANO  (circle (image-height PIANO) "solid" "white")))
(define (move im) (rotate (* -1 180) im))
(define (key-press im k)
  (cond [(equal? k "down") (move arrow)]
        [else im]))
(big-bang PIANO2
          (to-draw show-it)
          (on-key key-press))
          
```

Screenshots

![alt text](https://image.ibb.co/jsTGAa/1.png "Piano")
![alt text](https://image.ibb.co/mR1EwF/2.png "Arrow")
