#lang racket

(require rsound)


; Frames
(define frames-per-second 50000)

(define (seconds-to-frames seconds)
  (* seconds frames-per-second))


; Midi-number, frequency, pitch converters
(define (midi-to-freq num)
  (* (/ 440 32) (expt 2 (/ (- num 9) 12))))

(define (pitch-to-midi pitch)
  (+ (note pitch) (* (- (octave pitch) 1) 12)))

(define (pitch-to-freq pitch)
  (midi-to-freq (pitch-to-midi pitch)))


; Pitches
(define (make-pitch note octave)
  (cons note octave))
(define p make-pitch)

(define note car)
(define octave cdr)


; Notes
(define C 0)
(define C# 1)
(define Db 1)
(define D 2)
(define D# 3)
(define Eb 3)
(define E 4)
(define Fb 4)
(define E# 5)
(define F 5)
(define F# 6)
(define Gb 6)
(define G 7)
(define G# 8)
(define Ab 8)
(define A 9)
(define A# 10)
(define Bb 10)
(define B 11)
(define Cb 11)


; Sample Scales
(define cmaj-scale (list (p C 4) (p D 4) (p E 4) (p F 4) (p G 4) (p A 4) (p B 4) (p C 5)))
(define amin-scale (list (p A 3) (p B 3) (p C 4) (p D 4) (p E 4) (p F 4) (p G 4) (p A 4)))


; Playing Notes
(define (play-notes notes duration)
  (define (play-iter notes)
    (if (null? notes)
        #t
        (begin (play (make-tone (pitch-to-freq (car notes)) 1 (seconds-to-frames duration)))
               (sleep duration)
               (play-iter (cdr notes)))))
  (play-iter notes))
(define (play-scale notes duration)
  (play-notes (append notes (reverse notes)) duration))


; Transposition
(define (transpose-by-half-steps notes half-steps)
  (map (lambda (pitch)
         (if (>= (+ (note pitch) half-steps) 11)
             (make-pitch (- (+ (note pitch) half-steps) 11) (+ (octave pitch) 1))
             (make-pitch (+ (note pitch) half-steps) (octave pitch))))
       notes))