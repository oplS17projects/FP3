# RSound
Brian Medina

## Overview ##

I used RSound for my library, as my partner had done this library for FP1 and we are considering doing an audio related final project. Consequently, I also look at parts of PortAudio as well.

## Requirements for RSound and Troubleshooting

Having been burned in the past for not considering requirements and dependencies, I went ahead and used the package manager to install the dependencies and library itself, just those that are not already installed. There were a couple; those and RSound installed successfully.

At this point, RSound should work, right? Nope, didn't. Testing, I started with the command ```(play ding)```. The ```play``` procedure takes an rsound for its contract, which is an object that the library makes. I'll get to that later. The ding is a ready made rsound for testing. This didn't work, but a troubleshooting command, ```(diagnose-sound-playing``` quickly told me that this is a Windows sound output issue. RSound uses 16 bit PCM audio at 44.1 kHz, which is the sample rate used when mastering CDs. Most Windows PCs I use are set to 24 bit @ 48 kHz and the higher resolution causes an issue with another library, Portaudio, that RSound uses to play its stuff. I'm interested in Portaudio as well, so let's look at that.

Here's what Portaudio says about its file resolutions:

> These C libraries, like all other higher-level parts of this package, assume that all samples are represented as 16-bit signed integers, and that there are exactly two channels of interleaved audio. Doing something else would require recompiling the callback code, or writing your own callbacks and calling the portaudio functions directly.

> (...)

> Also note that different platforms are more or less friendly to various sample rates. Portaudio itself (both the library and this package) are sample-rate-agnostic, and appear to work just fine for different sample rates. Most of the automated tests on portaudio use the classical "red book" CD sample rate of 44.1KHz, but some Windows audio devices only support 48KHz, and this appears to work fine with Portaudio.

So it looks like perhaps the bitrate is more of an issue than 44.1 kHz. In addition, Windows has trouble with more than one audio stream, and uses MME as its audio API. Apparently, Portaudio also uses some C libraries to do its dirty work as well. MME is one of the APIs used for sounds in Windows, the other popular ones now being DirectSound and WASAPI, the latter of which coming with post-Vista versions of Windows. MME is comparatively old and is the culprit for the poor stream support and low bitrate/sample rate. 

## Portaudio and How RSound Works

So let's look at Portaudio first and see how it works. I want to see why I should use RSound instead of just using Portaudio.

First of all, some starter code.

```racket
#lang racket
 
(require portaudio
         ffi/vector)
 
(define pitch 426)
 
(define sample-rate 44100.0)
(define tpisr (* 2 pi (/ 1.0 sample-rate)))
(define (real->s16 x)
  (inexact->exact (round (* 32767 x))))
 
(define vec (make-s16vector (* 88200 2)))
(for ([t (in-range 88200)])
  (define sample (real->s16 (* 0.2 (sin (* tpisr t pitch)))))
  (s16vector-set! vec (* 2 t) sample)
  (s16vector-set! vec (add1 (* 2 t)) sample))
 
(s16vec-play vec 0 88200 sample-rate)
```

Output:

![01](/01.png "01")

In this instance, the program actually uses 2 libraries that I know nothing about, so let's look at them.
