# FP3: Final Project Assignment 3: Exploration 2
Due Sunday, March 26, 2017

## RSound: A Sound Engine for Racket
My name: Chhayhout Chhoeu 
Partner: LeangSeu Kim

For Exploration 2, I tested out the library called [Rsound]: A Sound Engine for Racket by John Clements <clements@racket-lang.org>. 

For this assignment, I used RSound i/o reader (rs-read) that will read in a .wav 16-bit files. RSound provides a means to represent, read, write, play, and manipulate sounds. By using the procedures of play, rs-read, make-pstream, rs-frames, pstream-queue, and pstream-current-frame. Which allowed me to queue sounds for playback. That will loop itself and continue to play forever by using RSound provides a "pstream" abstraction which falls conceptually in between play and signal-play which uses only single portaudio stream. It will continue to play the WAV file from the given path, returns it as an rsound For this case I used super mario theme song from [Audio]. I will be planning to add sound for the main project by using song kind of theme song later on. 
    
![Code](/code.png?raw=true "Code for FP3")


<!-- Links -->
[Audio]: https://archive.org/details/SuperMarioBros.ThemeMusic
[Rsound]: https://docs.racket-lang.org/rsound/index.html

