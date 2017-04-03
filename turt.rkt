#lang racket
 (require teachpacks/racket-turtle)

(define square1
      (list
       ;;(turn-right 90)
      ;; (forward 100)
            (turn-left 90)
            (forward 100)
            (turn-left 90)
            (forward 100)
            (turn-left 90)
            (forward 100)
            (turn-left 90)
            (forward 100)
           ))

(define (square2 s)
      (list (forward s)
            (turn-left 90)
            (forward s)
            (turn-left 90)
            (forward s)
            (turn-left 90)
            (forward s)
            ))

    (define coordinate-square
      (list (set-origin)
            (pen-up)
            (go-to -5 25)
            (pen-down)
            (go-to -5 125)
            (go-to -105 125)
            (go-to -105 25)
            (go-to -5 25)))

    (define move-down
      (list (pen-up)             
            (forward -30)            
            (pen-down)           
            ))

(define move-up
  (list (pen-up)
        (forward 130)
        (pen-down)))

(define move-left
  (list (pen-up)
        (turn-left 90)
        (forward 230)
        (pen-down)))

(define move-right
  (list (pen-up)
        (turn-left 90)
        (forward -30)
        (pen-down)))


(define square-list
  (list
   (set-bg-grid 130 130 "red")
   square1
   move-up
   square1
   move-left
   square1
   move-left
   square1
   ))

(draw square-list)
    ;;(draw (list (set-bg-grid 130 130 "red") coordinate-square))