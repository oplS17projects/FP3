#lang racket
(require rsound
         rsound/draw
         rsound/piano-tones)

;plays a built in, single note sound
(play ding)
;If this fails, manually change your audio device to 44100 Hz (under Playback Devices/Properties/Advanced/Default Format)

;Default Path - C:/Users/*YOUR USERNAME*/...
;Only Accepts .WAV files

;Reads the specified WAV file and returns an rsound
(define SILK (rs-read "Music/Silk_Pillows.wav"))
;Reads the specified portion of the specified .WAV file and returns an rsound
(define SILK_P1 (rs-read/clip "Music/Silk_Pillows.wav" 0 250000))
(define SILK_P2 (rs-read/clip "Music/Silk_Pillows.wav" 250000 500000))
(define SILK_P3 (rs-read/clip "Music/Silk_Pillows.wav" 500000 750000))

;uses the rsound play procedure to take the given rsound object and play it
(define (play-song song)
  (play song))
;uses the rsound rs-draw procedure to take the given rsound object and draw its waveform
(define (draw-song song)
  (rs-draw song))

