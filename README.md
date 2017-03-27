
## 2hdtp/universe, 2hdtp/image and Rsound
My name: Emmanuel Rosario

On this exploration I learned  about three different libraries  and how I can use them together. Those libraries were 2hdtp/universe, 2hdtp/image and RSound. After going over all the examples and function on their websites.  I wrote a program that is the starting point on my final project. I’m able to use 2hdtp/universe  to create scene and inside of it, scene can handle the user input. Inside the scene I place four images plus a background, also it display a text. In addition, the text display a prompt the guides the user to play or stop the song and sound. 

2hdtp/universe 
It handles the user input and base on the input it will play or stop a song.
; handle input
(define (handle-key n key)
  (cond
    ; play the signal
    [(key=? key "a") (signal-play my-signal)]
    ; stop 
    [(key=? key "s") (stop)]
    ; play the song
    [(key-event? key-p) (play a)]
    [else n]
    )
)

The 2hdtp/image 
Imported image by placing all of the argument images in a horizontal row, aligned along the centers of the world.
; scene drawing
(define (render y)
  (underlay/xy (overlay(beside
                (bitmap "up.png")
                (bitmap "right.png")
                (bitmap "down.png")
                (bitmap "left.png"))
                (bitmap "music-back.jpg")) 20 200 stop-text))

RSound
The RSound library reads and writes WAV files only. Reads a WAV file from the given path, returns it as an rsound.
; reads the music
(define a (rs-read "/home/emmanuel/Desktop/Final-P/FP3/Beethoven_5th_Symphony.wav"))
                
![test image](/World.png?raw=true "test image")

They can be found 

2hdtp/universe https://docs.racket-lang.org/teachpack/2htdpuniverse.html

2hdtp/image https://docs.racket-lang.org/teachpack/2htdpimage.html

RSound https://docs.racket-lang.org/rsound/index.html
