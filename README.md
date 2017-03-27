## VLC
My name: **RYAN DELOSH**

I set out to explore a library that would be able to play mp3 files once they were found 
within a given folder. After searching for a good amount of time and trying a few things out
with multiple libraries, I can across the vlc library. It is not ideal for what I want to do
but, it was the only thing that I found that was able to play mp3 files.
So I proceeded to test it out. first by starting vlc, adding my song to the queue and then
playing the song.
```
(require vlc)

(start-vlc)

(vlc-enqueue "/Users/liqueseous/ownCloud/Documents/Spring2017/OPL/FP3/Hypnotic.mp3")

(vlc-loop #t)

(vlc-play)
```
After that I tried some commands out like `(vlc-stop)` , `(vlc-pause)`, and `(vlc-is-playing)`

In the end I was successfully able to play and manipulate through a mp3 file.

![test image](/ScreenShot.png?raw=true "test image")
![vlc image](/ScreenShot2.png?raw=true "vlc image")



<!-- Links -->
[FP1]: https://github.com/oplS17projects/FP1
[schedule]: https://github.com/oplS17projects/FP-Schedule
[markdown]: https://help.github.com/articles/markdown-basics/
[forking]: https://guides.github.com/activities/forking/
[ref-clone]: http://gitref.org/creating/#clone
[ref-commit]: http://gitref.org/basic/#commit
[ref-push]: http://gitref.org/remotes/#push
[pull-request]: https://help.github.com/articles/creating-a-pull-request
