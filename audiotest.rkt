#lang racket

(require rsound)

;; Plays a simple ding
(define (play-ding)
  (play ding))

;; Plays the parks and rec theme song (from the NBC show Parks and Recreation)
;; Tried to set this up similar to the Account from ps4 to do various things with the stream
(define (make-stream)
  (let ((stream (make-pstream)))
    (define (set-volume amount)
      (begin (set! stream
                   (pstream-set-volume! stream amount))))
    (define (play-stream location)
      (pstream-play stream (rs-read location)))
    (define (stop-stream)
      (stop))
    (define (dispatch message)
      (cond ((eq? message 'set-volume) set-volume)
            ((eq? message 'play-stream) play-stream)
            ((eq? message 'stop-stream) stop-stream)
            ((eq? message 'clear-stream) (pstream-clear! stream))
            ((eq? message 'play-ding) play-ding)
            (else (error "Uknown request"))))
    dispatch))