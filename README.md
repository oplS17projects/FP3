## Library : RSound
My name: **Kevin Fossey**

For this exploration I went with the [RSound](https://docs.racket-lang.org/rsound/index.html) library. This an audio library which provides many useful procedures and functionality to allow a user to create, play, manipulate and even draw sounds.  
  
As the documentation suggests, I ran the test of `(play ding)` which plays a single note, built in `rsound`, but I recieved `pa-open-stream: Invalid device` error, and had to manually change the format of my default playback device to 44100 Hz.  
  
After this, everything worked very well. As the documentation mentions, the only supported file type is .wav, so I convereted an MP3 file I had, and then using `(rs-read)` I was able to convert that to an `rsound` object, and play it using `(play)`  
  
I wrote a simple program that creates a few `rsound` objects from my .wav file and provides procedures to play them.  
```scheme  
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
```  
So the `(play-song)` procedure simply plays the `rsound` objects that is passed to it, so `(play-song SILK)` will play the whole song. You can also play parts of an rsound file, or only read in parts of a .wav file. The files are defined in terms of frames, so the `SILK_P2` is the frames from frame 250,000 to frame 500,000, which is only a few seconds worth of the song.  
  
A more interesting functionality of the library I found is seen in the `(draw-song)` procedure. The `(rs-draw)` actually provides a visual representation of a given rsound file.
  
So `(draw-song SILK_P1)` produces this  
![draw-song 1](/sound_1.png?raw=true "Sound 1")  
  
and `(draw-song SILK_P2)` produces this  
![draw-song 2](/sound_2.png?raw=true "Sound 2")  
  
This library will definitely be useful for many applications, and I only scrathed the surface, as there is functionality to create your own audio dynamically and manipulate and filter audio in multiple ways. This library will be useful for our Project as well, as audio cues, sound effects and background music are all important features for building entertaining and engaging games.
