# RSound
Brian Medina

## Overview

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

And it successfully played the sound, too.

In this instance, the program actually uses 2 libraries that I know nothing about, so let's look at vector one. It's a package installed with base Racket, called Safe Homogenous Vectors in documentation. 

> Homogenous vectors are similar to C vectors (see Safe C Vectors), except that they define different types of vectors, each with a fixed element type. 

So these procedures make vectors, complete with references to specific parts and whatnot. It doesn't have to walk down the list to find stuff, unless I'm really off here. This is useful in the case of Portaudio because of the way playing sounds in implemented. Portaudio makes a vector of every sample. It has 88.2k of them because it has 44.1k for each ear. This is per second, the sample rate. The defines up front set up some math that it does, literally making a sine wave using some math stuff. The real->s16 define is just to make the math fit into each box of the vector, because each box only has 16 bits in it, so it has to round. So ```s16vec-play``` is a procedure that takes a vector, the range, and the sample rate.

When I tried to look at vec, it told me it's a ```#<s16vector>```. It doesn't show it like cons cells or lists. But the vectors can be accessed directly, like C vectors and whatnot.

RSound takes this arduous process and does it all by itself, making it much easier to make sounds. Using straight up Portaudio to make piano or synth tones would be torture in Portaudio, but with RSound it's a much less painful form of torture.

## RSound capabilities

First of all, I skipped to the end and had it run some cool sample code so I can pick it apart.

```racket
; scrobble: number number number -> signal
; return a signal that generates square-wave tones, changing
; at the given interval into a new randomly-chosen frequency
; between lo-f and hi-f
(define (scrobble change-interval lo-f hi-f)
  (local
    [(define freq-range (floor (- hi-f lo-f)))
     (define (maybe-change f l)
       (cond [(= l 0) (+ lo-f (random freq-range))]
             [else f]))]
    (network ()
             [looper <= (loop-ctr change-interval 1)]
             [freq = (maybe-change (prev freq 400) looper)]
             [a <= square-wave freq])))
 
(define my-signal
  (network ()
           [a <= (scrobble 4000 200 600)]
           [b <= (scrobble 40000 100 200)]
           [lpf-wave <= sine-wave 0.1]
           [c <= lpf/dynamic (max 0.01 (abs (* 0.5 lpf-wave))) (+ a b)]
           [b = (* c 0.1)]))
 
; write 20 seconds to a file, if uncommented:
; (rs-write (signal->rsound (* 20 44100) my-signal) "/tmp/foo.wav")
 
; play the signal
(signal-play my-signal)
```

This program, when run, makes a random weird synth sound that I can only imagine is made using subtractive synthesis. Subtractive synthesizers make sounds by subtracting waveforms from other waveforms, like sine waves and sawtooth waves. 

The guy's explanation for this tone is good enough; it basically makes random square waves at random frequencies. I can hear that it fades in and out and repeats as well, but that's not ```scrobble``` doing that, it's ```my-signal``` below. Scrobble makes local functions to randomly change the numbers in the range of frequencies, and makes a ```network``` of that. The other object is one of those as well, so it's time to look at a ```network```.

> For signal processing, RSound adopts a dataflow-like paradigm, where elements may be joined together to form a directed acyclic graph, which is itself an element that can be joined together, and so forth. (...)

> The most basic form of node is simply a procedure. It takes inputs, and produces outputs. In addition, the network form provides support for nodes that are stateful and require initialization.

> A node that requires no inputs is called a signal. (...)

> A node that takes one input is called a filter.

So this is an interesting object. It appears I was kind of right when I called this subtractive synthesis. Networks are just things that can produce output or add a bunch of things. These things can then be used in other networks to make complex sounds. We can see that the networks in the thing above are all signals, because they have no arguments.

Now here's what those ```<=``` and ``` =``` things mean:

> A clause that uses = simply gives the name to the result of evaluating the right-hand-side expression. A clause that uses <= evaluates the input expressions, and uses them as inputs to the given network.

So for scrobble:

```racket
    (network ()
             [looper <= (loop-ctr change-interval 1)]
             [freq = (maybe-change (prev freq 400) looper)]
             [a <= square-wave freq])))
```

The network has an input of the looper and a that are added to the output. The looper uses the ```loop ctr``` procedure, which grows the number it returns until it is higher than its first argument, then it subtracts the first argument from the result, resetting it down relatively close to 0 again and starting over. This makes freq pretty random using ```maybe-change``` but rising in frequency until it periodically resets. Then it outputs a square-wave of this.

Scrobble is used in the resulting signal that is played as my-signal.

```racket
(define my-signal
  (network ()
           [a <= (scrobble 4000 200 600)]
           [b <= (scrobble 40000 100 200)]
           [lpf-wave <= sine-wave 0.1]
           [c <= lpf/dynamic (max 0.01 (abs (* 0.5 lpf-wave))) (+ a b)]
           [b = (* c 0.1)]))
```

Now this code outputs 2 scrobbles with different cap frequencies and whatnot, and puts them in a and b. lpf-wave probably stands for low filter pass. This is, I assume, a low pass filter, which is so named because it filters out frequencies from a signal, and only the low frequencies pass, as oppose to a high pass, where the high ones pass, or band pass, which passes frequencies in a specific band. It appears that the lpf is a sine wave, added to this lpf/dynamic procedure, which produces another signal which filters the other ones. It's a slow sine wave, which accounts for the rising and lowing periodic volume shift in the product.

So that's a complex version of making signals in RSound. It will probably take a long time of playing around in this thing to make something like that.

## My Own RSound

```racket
(define brians-signal
  (network ()
           [a <= sine-wave 600]
           [b <= sine-wave 30]
           [out = (+ a b)]))

(signal-play brians-signal)
```

(turn down sound a lot. It has an amplitude of 1, which is just full volume.)

This plays a really disgusting sound of these two sine waves added together. It's probably because the two waves are high enough frequency to be discordant. I can set these sine waves to be anything. Having a sine-wave of 1 or 2 is an LFO, low frequency oscillator. When the wave is so slow like that, it oscillates in the other wave and changes its volume or whatever the LFO filters. I can even add stuff.

```racket
(define brians-signal
  (network ()
           [lfo <= sine-wave 3]
           [a <= sawtooth-wave (+ 400 (* 50 lfo))]
           [lfo-b <= sine-wave .1]
           [c <= sine-wave (+ 600 (* 75 lfo-b))]
           [out = (+ a c)]))

(signal-play brians-signal)
(sleep 20)
(stop)
```

This makes a weird alarm sound. It has 2 lfos that affect the frequencies of signals a and c, with the one affecting the sawtooth being much faster.
