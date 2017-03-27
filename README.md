# FP3
**Name: LeangSeu Kim**
**Partner: Chhayhout Chheou**
**Project Name: Space Shooting**

### 2htdp/image

defining a bunch of pictures so I can use it after.

![p0.png](/p0.png)

place the character on the background.

![p2.png](/p2.png)

Adding tree to the canvas

![p1.png](/p1.png)

### 2htdp/universe

creating animation

```racket
(define (create-scene width)
  (underlay/xy background width 160 timber-man-left))

(animate create-scene)
```
This will product an animation that move timber-man-left from left to right

![p3.png](/p3.png) ![p4.png](/p4.png)! [p5.png](/p5.png)

I download all the asset from this [site](http://www.emanueleferonato.com/2015/02/16/create-an-html5-game-like-timberman-in-a-matter-of-minutes-with-mightyeditor/)

The plan for this project to make the game similiar [timberman](http://www.crazygames.com/game/timberman)

I will be working on gui part and my partner will be doing the sound. Then finally we will combine it for the game.