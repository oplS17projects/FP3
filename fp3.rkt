#lang racket
(require rsound)
(require rsound/piano-tones)
(require portaudio
         ffi/vector)
; 
;(define pitch 426)
; 
;(define sample-rate 44100.0)
;(define tpisr (* 2 pi (/ 1.0 sample-rate)))
;(define (real->s16 x)
;  (inexact->exact (round (* 32767 x))))
; 
;(define vec (make-s16vector (* 88200 2)))
;(for ([t (in-range 88200)])
;  (define sample (real->s16 (* 0.2 (sin (* tpisr t pitch)))))
;  (s16vector-set! vec (* 2 t) sample)
;  (s16vector-set! vec (add1 (* 2 t)) sample))
; 
;(s16vec-play vec 0 88200 sample-rate)
 
; scrobble: number number number -> signal
; return a signal that generates square-wave tones, changing
; at the given interval into a new randomly-chosen frequency
; between lo-f and hi-f
;(define (scrobble change-interval lo-f hi-f)
;  (local
;    [(define freq-range (floor (- hi-f lo-f)))
;     (define (maybe-change f l)
;       (cond [(= l 0) (+ lo-f (random freq-range))]
;             [else f]))]
;    (network ()
;             [looper <= (loop-ctr change-interval 1)]
;             [freq = (maybe-change (prev freq 400) looper)]
;             [a <= square-wave freq])))
; 
;(define my-signal
;  (network ()
;           [a <= (scrobble 4000 200 600)]
;           [b <= (scrobble 40000 100 200)]
;           [lpf-wave <= sine-wave 0.1]
;           [c <= lpf/dynamic (max 0.01 (abs (* 0.5 lpf-wave))) (+ a b)]
;           [b = (* c 0.1)]))
; 
;; write 20 seconds to a file, if uncommented:
;; (rs-write (signal->rsound (* 20 44100) my-signal) "/tmp/foo.wav")
; 
;; play the signal
;(signal-play my-signal)

;(define brians-signal
;;  (network ()
;;           [lfo <= sine-wave 3]
;;           [a <= sawtooth-wave (+ 400 (* 50 lfo))]
;;           [lfo-b <= sine-wave .1]
;;           [c <= sine-wave (+ 600 (* 75 lfo-b))]
;;           [out = (+ a c)]))
;
;(signal-play brians-signal)
;(sleep 10)
;(stop)

(play (piano-tone 60))
(sleep .5)
(play (piano-tone 62))
(sleep .5)
(play (piano-tone 64))
(sleep .5)
(play (piano-tone 65))
(sleep .5)
(play (piano-tone 67))
(sleep .5)
(play (piano-tone 69))
(sleep .5)
(play (piano-tone 71))
(sleep .5)
(play (piano-tone 72))
(sleep .5)
(play (piano-tone 72))
(sleep .5)
(play (piano-tone 71))
(sleep .5)
(play (piano-tone 69))
(sleep .5)
(play (piano-tone 67))
(sleep .5)
(play (piano-tone 65))
(sleep .5)
(play (piano-tone 64))
(sleep .5)
(play (piano-tone 62))
(sleep .5)
(play (piano-tone 60))