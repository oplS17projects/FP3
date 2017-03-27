#lang racket
(require rsound)

(define sound1 (rs-read "/home/mike/Desktop/FP/ShakeYourBootay.wav"))
(define sound2 (rs-read "/home/mike/Desktop/FP/UpbeatFunk.wav"))

;creates and RSound which plays three different sound at the same time
(define sound3 (rs-overlay* (list sound1 sound2 (rs-read "/home/mike/Desktop/FP/808/clap (10).wav"))))


;play a continuous sound
(define (play-forever sound)
  (define p (make-pstream)) ;creates a pstream
  (define len (rs-frames sound))
  (let loop ([t 0])
    (pstream-queue p sound (+ t 44100))
    (define next-t (+ t len))
    (sleep (* 1/44100 (- next-t (pstream-current-frame p))))
    (loop next-t)))

(define (play-sound sound)
  (if(null? sound)
     "Error: Must play a valid RSound"
     (cond
       ((eq? sound 'sound1) (play sound1))
       ((eq? sound 'sound2) (play sound2))
       ((eq? sound 'sound3) (play sound3)))))


;plays sound1, records it, then plays the sound again 
(define (sound4)
  (play sound1)
  (sleep .25)
  (play (record-sound (rs-frames sound1))))

