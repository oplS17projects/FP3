## RSound
My name: Alexander Infantino

This library contains various procedures to play and manage sounds.

This is not installed by default. You must use the package manager in racket to install the RSound package

Once the package installed, it is very easy to tell if everything is setup properly.
First add
```
(require rsound)
```

and then simply call

```
(play ding)
```

should play a small ding from your computer.

Since I am trying to create a game with my final project, I wanted to see how easy it is to manipulate streams and load sounds from external files. My favorite show is Parks and Recreation so I wanted to see if I could get the theme song playing from my racket program. RSound contains a lot of helpful calls that can be used to directly manipulate a stream once its been instanciated. I pretty much create a simple object that works much like the make-account procedure does in PS4.

```
(define (make-stream)
    (let ((stream (make-pstream)))
        (define (set-volume amount)
            (begin (set! stream
                (pstream-set-volume! stream amount))))
        (define (play-stream location)
            (pstream-play stream (rs-read location)))
        (define (stop-stream)
            (stop))
        (define (dispatch message)
            (cond ((eq? message 'set-volume) set-volume)
                  ((eq? message 'play-stream) play-stream)
                  ((eq? message 'stop-stream) stop-stream)
                  ((eq? message 'play-ding) play-ding)
                  (else (error "Uknown request"))))
        dispatch))
```

From this little stream driver, I was able to manipulate the stream to get it playing, stop playing, change the volume, etc...

What's nice about RSound is that it also outputs some simple text about queue. Here is what the program I wrote looks like when run fully.

![output_image](/output_image.png?raw=true "output image")

Further Study:

I need to look farther into manipulating the stream queue to see how adding more sounds affects it.

Issues:

I have been running into issues where DrRacket will crash and I think it might be related how to I am handling the sound queues. I haven't yet been able to stop the sound from playing and then adding a new sound to the queue. This will take further looking at, but currently this library may prove useful for the final project.
