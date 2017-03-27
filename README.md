## rsound
My name: Matthew DiBello

Write what you did!
Remember that this report must include:

Since our project is a sheet music editor that can play some of the sheet
music made int he application, we need to be able to deal with sounds. So
for this exploration I explored rsound, which deals with playing sounds in
racket. I'm still unsure of our final implementation of playing sounds from
the sheet music, but here I primarily worked with playing tones, which are
created from a specific frequency of sound. I created a number of small
sections of code to implement a few small ideas.

Under frames, I set a baseline variable that holds the number of frames in
a second, a way to convert from seconds to frames.

The next section contains three converters between different measurements
of the pitch of a note:
1) Midi number
2) frequency
3) pitch (a cons cell of the note number and octave number)
One example:
```
(define (pitch-to-midi pitch)
  (+ (note pitch) (* (- (octave pitch) 1) 12)))
```

The next section, pitches, is where I created the pitch structure, and a few
helper functions. Principally:
```
(define (make-pitch note octave)
  (cons note octave))
```

The next sections defines a bunch of notes with their respective note numbers,
regardless of octave number. An example definition: `(define F# 6)`

The sample scales section defines a major and minor scale to demonstrate a list
of notes, and the function implemented later on called 'play-notes'. Here's the
C Maj scale definition:
`(define cmaj-scale (list (p C 4) (p D 4) (p E 4) (p F 4) (p G 4) (p A 4) (p B 4) (p C 5)))`
Where 'p' is short-hand for 'make-pitch'.

The 'playing notes' section is a iterative process, recursive procedure for playing
a list of notes:
```
(define (play-notes notes duration)
  (define (play-iter notes)
    (if (null? notes)
        #t
        (begin (play (make-tone (pitch-to-freq (car notes)) 1 (seconds-to-frames duration)))
               (sleep duration)
               (play-iter (cdr notes)))))
  (play-iter notes))
```
After this, there is a small function for playing a scale, which plays a series of notes
forwards then backwards.

Finally, the most interesting part (and more relevant to this class) is the
transposition section, which contains one section, which transposes a series of notes
up by a given number of half-steps. It uses map:
```
(define (transpose-by-half-steps notes half-steps)
  (map (lambda (pitch)
         (if (>= (+ (note pitch) half-steps) 11)
             (make-pitch (- (+ (note pitch) half-steps) 11) (+ (octave pitch) 1))
             (make-pitch (+ (note pitch) half-steps) (octave pitch))))
       notes))
```

Here's some output from some of my code:
![code_output](/codeoutput.png?raw=true "Code Output")
