# RSound Library

William Bobos

# Introduction
My project partner and I decided to create a game for our final project.
One aspect we decided on on was sound. We are hoping to add sound effects
to our game. I decided on the Rsound library.


# Installation
Well installation was supposedly straightforward. To use the Rsound library,
a simple line of code was needed:

```racket
#lang racket

(require rsound)
```

The `(require rsound)` is all that's needed to utilize the library.

This didn't work at all. It may be outdated.
After millenia of searching, I found multiple solutions.

Virtually all of the solutions failed.

```raco pkg install rsound```

```(require (planet clements/rsound:1:=2))```

```(require (planet clements/rsound:2:=2))```

```(require (planet clements/rsound:3:=2))```

```(require (planet clements/rsound:4:=2))```

```(require (planet clements/rsound))```

These solutions, and others all failed.

Other attempts included various methods involving the package manager.
Ultimately, using the packager manager alongside the command line resulted
in RSound importing with no errors.

# Experimentation
I started with simple goals:

* import RSound
* play a sound

Once these goals were accomplished, I'd attempt to use RSounds' other
functions into my code.

### Import RSound
Fortunately, I accomplished the importation of the library.

There was only one remaining problem: no sound.

```(diagnose-sound-playing)```

I used this code to diagnose what API my machine was using. To test for sound,
I used:

```(play ding)```

RSound allows the user to set their host's API, I changed the default using:

```(host-api 'paALSA)```

Eventually I was able to use ```(play ding)``` to output sound. No, this wasn't
the end of my troubles with RSound. The sound output was garbled.

Through further investigation, I decided to examine the various methods
of sound output. I experimented with various audio rates, and lastly channels.
I discovered my HDMI was outputting multi-channel audio. I disabled HDMI and
tried using another output for sound. Output through my laptop's built-in
audio was flawless. Sound output using multi-channel HDMI was the culprit.
After swapping back and forth several times between HDMI and laptop audio,
the garbled audio disappeared.


No, I don't know why, and I'm too tired to care.

### Play a sound
I used RSound's test sound to test for audio functionality:

```
(play ding)
```
Many, many hours later, my initial goals were finally complete.

I decided to try the I/O functions

# Implementation
I wanted to implement a function to read and play WAV data from my hard disk.

I converted a 2 minute MP3 file into WAV, and attempted to have RSound play it.

This required code that handled the following tasks:

* Read .WAV audio file
* Bind .WAV to an rsound object
* Play rsound

```
(define power-core
  (rs-read "power-core.wav"))
```
This code binds my .WAV file to an rsound object.

```(play power-core)```

This code plays an rsound object.


# Final Results
I continued spending many hours working with RSound.

I experimented with streams, frames, and other RSound functions.
I wanted a method of playing background music. I created a method
that:

* reads in an rsound object
* creates a pstream
* sets pstream initial volume
* obtains audio frame length
* adds rsound to pstream
* plays pstream
* loops the pstream

This function can now be used to loop background music.

![test image](/rsound.png?raw=true "rsound")


