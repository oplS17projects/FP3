#lang racket
(require vlc)

(start-vlc)

(vlc-enqueue "/Users/liqueseous/ownCloud/Documents/Spring2017/OPL/FP3/Hypnotic.mp3")

(vlc-loop #t)

(vlc-play)