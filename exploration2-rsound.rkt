#lang racket
(require rsound)

(define A4-key
  (network ()
           [A4 <= sine-wave 440]
           [out = A4]))
(define B4-key
  (network ()
           [B4 <= sine-wave 493.883]
           [out = B4]))
(define C5-key
  (network ()
           [C5 <= sine-wave 523.251]
           [out = C5]))
(define D5-key
  (network ()
           [D5 <= sine-wave 587.330]
           [out = D5]))
(define E5-key
  (network ()
           [E5 <= sine-wave 659.225]
           [out = E5]))
(define F5-key
  (network ()
           [F5 <= sine-wave 698.456]
           [out = F5]))
(define G5-key
  (network ()
           [G5 <= sine-wave 783.991]
           [out = G5]))
(define A5-key
  (network ()
           [A5 <= sine-wave 880]
           [out = A5]))
(define B5-key
  (network ()
           [B5 <= sine-wave 987.767]
           [out = B5]))
(define C6-key
  (network ()
           [C6 <= sine-wave 1046.50]
           [out = C6]))

;#| testing C5-C6
(signal-play C5-key)
(sleep 1)
(stop)

(signal-play D5-key)
(sleep 1)
(stop)

(signal-play E5-key)
(sleep 1)
(stop)

(signal-play F5-key)
(sleep 1)
(stop)

(signal-play G5-key)
(sleep 1)
(stop)

(signal-play A5-key)
(sleep 1)
(stop)

(signal-play B5-key)
(sleep 1)
(stop)

(signal-play C6-key)
(sleep 1)
(stop)
;|#