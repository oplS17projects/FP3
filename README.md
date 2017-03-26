# FP3: Final Project Assignment 3: Exploration 2
Due Sunday, March 26, 2017

## My Library: gui;images
My name: Ruowei Zhang

For our team project, firstable we need to create GUI for players. I chose to use gui and images libraries to complete it.

Here are the outputs:
![board](/board.png?raw=true "board image")

If the user click the "Start!" button, the GUI would become:
![start](start.png?raw=true "start image")

If the user click the "Stop!" button, the GUI would become:
![stop](stop.png?raw=true "stop image")

I use functions in gui/base to create the frane and canvas.
Our board is 15X15.
References: https://docs.racket-lang.org/gui/frame_.html?q=frame

`(define frame (new frame%
                   [label "Simple Gomoku"] ;;needs improvement
                   [width 600]
                   [height 600]))`
                   
`(new canvas% [parent frame]
             [paint-callback
              (lambda (canvas dc)
                (send dc set-scale 10 10)
                ;;(send dc set-text-foreground "blue")
                ;;(send dc draw-text "Don't Panic!" 0 0)
                (send dc set-pen "black" 0.25 'solid)
                (let loop ((times 15))
                  (if (= times 0)
                      (display "stopped")
                      (begin (send dc draw-line (* 4 times) 0 (* 4 times) (* 4 15))
                             (loop (- times 1)))))
                (let loop ((times 15))
                  (if (= times 0)
                      (display "stopped")
                      (begin (send dc draw-line 0 (* 4 times) (* 4 15) (* 4 times))
                             (loop (- times 1)))))
                )])`
Make a button in the frame
References:https://docs.racket-lang.org/gui/button_.html

`(new button% [parent frame]
             [label (text-icon "Start!"
             (make-font #:weight 'normal #:underlined? #f)
             #:color "Green Yellow" #:height 25)]
             ; Callback procedure for a button click:
             [callback (lambda (button event)
                         (send msg set-label "Gomoku Started"))])`

Make a static text message in the frame
`(define msg (new message% [parent frame]
                          [label "Please Start the Game!"]))`


The library images/icons contains many function of creating the icon.
I use images/icons/symbol to make start and stop icons.
References:http://docs.racket-lang.org/images/Icons.html#%28part._.About_.These_.Icons%29

I also use pict images/icons/control images/icons/style to make 3D black and white chess.
![bw](blackwhite.png?raw=true "blackwhite image")
`(define outline-colorb (icon-color->outline-color "black"))
 (define brush-pictb (colorize (filled-ellipse 20 20) "black"))
 (define pen-pictb (linewidth 2 (colorize (ellipse 20 20) outline-colorb)))
 (bitmap-render-icon
   (pict->bitmap (inset (cc-superimpose brush-pictb pen-pictb) 1))
   5/8 glass-icon-material)`

<!-- Links -->
[FP1]: https://github.com/oplS17projects/FP1
[schedule]: https://github.com/oplS17projects/FP-Schedule
[markdown]: https://help.github.com/articles/markdown-basics/
[forking]: https://guides.github.com/activities/forking/
[ref-clone]: http://gitref.org/creating/#clone
[ref-commit]: http://gitref.org/basic/#commit
[ref-push]: http://gitref.org/remotes/#push
[pull-request]: https://help.github.com/articles/creating-a-pull-request

