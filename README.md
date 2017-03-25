## My Library: pict3d 
## Document is at http://docs.racket-lang.org/pict3d/index.html
## or http://www.ccs.neu.edu/home/types/racket-doc/pict3d/index.html

My name: Hung Q. Nguyen

Write what you did!

Initial thought: I wanted to practice making a 3D world for my final project and I am very impressed by watching Neil Toronto's work at fourth RacketCon (Full video and live: https://www.youtube.com/watch?v=t3xdv4UP9-U), so I decided to make a 3D moving-universe.

What I did:
- Making a list of 500 spheres at a random position and color which do not have the lightening affect.

	```
	(for/list ([i 500])
      (with-color (rgba (get-random-color))
        (sphere (get-random-position)
                (* 0.25 (+ (random) 0.1)))))
	```

- Then, I make another list of 500 spheres which have same attributes but they do have the lightening affect
	```
	(for/list ([i 500])
      (combine
       (with-color (rgba "black")
         (with-emitted (emitted (get-random-color) (* (+ 0.25 (* (random) 0.25)) 32))
           (sphere (get-random-position)
                   (* 0.25 (+ (random) 0.1)))))
       (light (get-random-position) (emitted (get-random-color) (+ 0.25 (* (random) 0.25)))))))))
	```
- After, I created the SUN to stand at the middle of the universe (I thought it would be coller if I make the sun moves as well, so I moved its initial position from origin (0,0,0) to position (1,1,1)).

	```
	(define sun (set-emitted
             (parameterize ([current-color  (rgba "chocolate")])
               (sphere (pos 1 1 1) 1/5))
             (emitted "lightyellow" 10)))
    ```

- I used the simple given examples for camera rotating when frame is on-draw (in the provided link -- #10)

	```
	((define lights+camera
	  (combine (light (pos 0 1 2) (emitted "Thistle"))
	           (light (pos 0 -2 -2) (emitted "PowderBlue"))
	           (basis 'camera (point-at (pos 1 1 0) origin))))
	```
- Finally, wrap everything up and display all the spheres into the frame 1000x800
	```
	(define (on-draw s n t)
	  (combine (rotate-z (rotate-y (rotate-x (combine sun stars)
	                                         (/ t 40))
	                               (/ t 35))
	                     (/ t 38))
	           lights+camera))

	(big-bang3d 0 #:on-draw on-draw
            #:name "Cosmos Travelling"	 	 	 	 
            #:width 1000	 	 	 	 
            #:height 800)
	```

###### RESULT SCREENSHOT
![alt tag](https://github.com/hnguyenworkstation/FP3/blob/master/screenshot.png)

