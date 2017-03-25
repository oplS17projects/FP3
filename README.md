1. To start, [**fork** this repository][forking]. 
1. Add your `.rkt` Racket source file(s) to the repository. 
1. Add any images to the repository.
1. Modify the `README.md` file and [**commit**][ref-commit] changes to complete your report.
1. Ensure your changes (report in `md` file, added `rkt` file(s), and images) are committed to your forked repository.
1. [Create a **pull request**][pull-request] on the original repository to turn in the assignment.

## Library Name: Rsound
My name: Michael Danino

This assignment didn't seem very helpful for my project personally, since all that was really needed for the game Molly and I will work on is in 2htdp/image and universe. Since something was required, I decided to add sound.

to add the library, I ran
```
Racket>raco.exe pkg install -u --auto rsound
```
For now, all the sound is, was to read in a .wav file and store it in an object
```racket
(define arrowSound (rs-read "arrow.wav"));read in the arrow sound to be played upon shooting
```
next, I needed to add when I wanted the sound to play. I had it play when an arrow would be shot, in this case when the space bar is pressed. Since I already have a function for this, it will be in the "start-shooting" function of the hook object/class.
```racket
[(equal? comm 'start-shooting) (if (equal? shooting 'no) (begin (play arrowSound) (set! shooting 'yes)) "shooting")] ; need to debug this, if statement doesn't seem to read properly
```
Remember that this report must include:

* a narrative of what you did
* highlights of code that you wrote, with explanation
* output from your code demonstrating what it produced
* at least one diagram or figure showing your work

The narrative itself should be no longer than 350 words. 

You need at least one image (output, diagrams). Images must be uploaded to your repository, and then displayed with markdown in this file; like this:

![on-load](https://github.com/mdanino94/FP3/blob/master/on-load.png)

![moving around](https://github.com/mdanino94/FP3/blob/master/moving%20around.png)

![mid-shoot](https://github.com/mdanino94/FP3/blob/master/mid-shoot.png)

image: http://www.planwallpaper.com/static/images/cool-background.jpg

arrow sound: https://www.freesound.org/people/braqoon/sounds/161098/
