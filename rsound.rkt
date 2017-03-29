#lang racket
;; (require rsound) initially didn't work

;(require portaudio)
;(require (planet clements/rsound:4:=2))
;(require (planet clements/rsound))


(require rsound)


;(play ding)

(define power-core
  (rs-read "power-core.wav"))
  ;; this allows for only a portion of the file to load
  ;(rs-read/clip "power-core.wav" 0 250000))

(define sample
  (rs-read "sample.wav"))

;(define mystream (make-pstream))
;(define mystream2 (make-pstream))

;(pstream-queue mystream power-core 0)
;(pstream-queue mystream2 sample 600000)


;(define (stopstream)
 ; (pstream-set-volume! mystream 0))

;(pstream-queue-callback mystream stopstream 500000)

;(rs-frames power-core)
;5574528


;; background music looping function
(define (play-rsound-loop audio #:init-volume [init-volume 0.3])
 
  (define myStream (make-pstream #:buffer-time 0.2)) ;; create pstream

  (pstream-set-volume! myStream init-volume) ;; set initial pstream volume
  
  (define totalFrames (rs-frames audio)) ;; gets frame length from audio

  (define (audioLoop) ;; loops pstream function
    (pstream-play myStream audio) ;; adds audio file to pstream

    ;; callback function
    ;; this calls itself once the audio file ends by using the frame length
    (pstream-queue-callback myStream
                            audioLoop
                            (+ (pstream-current-frame myStream) totalFrames)))

  (thread audioLoop)) ;; puts function into thread

(play-rsound-loop power-core #:init-volume 1)


;(play power-core)
;(diagnose-sound-playing)
