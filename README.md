# FP3: Final Project Assignment 3: Exploration 2
Due Sunday, March 26, 2017

## Library Name Here : RSound
My name: Marittya Keu

For FP3, I choose to use the RSound library. Being a hip-hop head, it's only natural I choose to use a library that deals with the creation and manipulation of sounds. This is an appropriate library to use because my partner and I chose to do a project to create a game similar to Guitar Hero. For this portion of the project, I downloaded a few free .WAV files from the following websites.....

http://www.brainybetty.com/soundsforpowerpoint2.htm

http://hiphopmakers.com/free-808-drum-kit-227-samples

I took these .wav files and created them into an RSound and was then able to drive them around.....

```
(define sound1 (rs-read "/home/mike/Desktop/FP/ShakeYourBootay.wav"))
(define sound2 (rs-read "/home/mike/Desktop/FP/UpbeatFunk.wav"))

;creates and RSound which plays three different sound at the same time
(define sound3 (rs-overlay* (list sound1 sound2 (rs-read "/home/mike/Desktop/FP/808/clap (10).wav"))))
```

The code below created a function where you are allowed to play several different sounds depending on what you type as a parameter.
```
(define (play-sound sound)
  (if(null? sound)
     "Error: Must play a valid RSound"
     (cond
       ((eq? sound 'sound1) (play sound1))
       ((eq? sound 'sound2) (play sound2))
       ((eq? sound 'sound3) (play sound3)))))
```

RSound allows you to do many different neat things. One of the feature is to allow you to record a sound using the ```record-sound```  function. It takes as a parameter the length of a frame of an RSound and plays it back that length

```
;plays sound1, records it, then plays the sound again 
(define (sound4)
  (play sound1)
  (play (record-sound (rs-frames sound1))))
```

The RSound library has many useful functionalies. With it, my partner and I plan to use and manipulate the functions to create a game similar to Guitar Hero. 


***********************************************OUTPUT IMAGE*************************************************


![alt tag](https://github.com/MarittyaKeu/FP3/blob/master/screenshotFP3.png)



<!-- Links -->
[FP1]: https://github.com/oplS17projects/FP1
[schedule]: https://github.com/oplS17projects/FP-Schedule
[markdown]: https://help.github.com/articles/markdown-basics/
[forking]: https://guides.github.com/activities/forking/
[ref-clone]: http://gitref.org/creating/#clone
[ref-commit]: http://gitref.org/basic/#commit
[ref-push]: http://gitref.org/remotes/#push
[pull-request]: https://help.github.com/articles/creating-a-pull-request
