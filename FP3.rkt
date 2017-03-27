 #lang racket

(require racket/gui/base)

(define frame (new frame%
                   [label "FP3 - Rackman"]
                   [width 600]
                   [height 600]))
(define pacImage (read-bitmap "/home/mohammed/Desktop/pacman.jpg"))
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
(send frame show #t)