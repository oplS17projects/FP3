#lang racket
;;Using rsound to add sounds to our game
(require (planet clements/rsound))
(require htdp/world)

;;Function that will load sounds from file into memory
  
(define (change w a-key)
  (cond
    [(key=? a-key 'left)  (play (rs-read "Sound1.wav"))]
    [(key=? a-key 'right) (play (rs-read "Sound1.wav"))]
    [(key=? a-key 'up)    (play (rs-read "Sound1.wav"))]
    [(key=? a-key 'down)  (play (rs-read "Sound1.wav"))]
    [(key=? a-key #\space)  (play (rs-read "Sound2.wav"))]
    [(key=? a-key 'escape)  (play (rs-read "Sound3.wav"))]
    ))

;;Testing an environment that accepts key events (This may not be the final library we use)
;;Takes xWindowSize yWindowSize and two numbers that I am still trying to figure out the purpose of
(cond ((false?(big-bang 500 500 1 2)) (display "Failed to load world\n"))
    (else (display "World loaded succesfully\n")))

;;Call on-key-event, which will listen for keyboard events and a cond will handle each key press
(cond ((false?(on-key-event change)) (display "Failed to start key-event-handler\n"))
    (else (display "Sucessfully loaded key-event-handler\n")))