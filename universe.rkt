#lang racket

(require racket/gui
         pict3d
         pict3d/universe)

(current-material (material #:ambient 0.05
                            #:diffuse 0.6
                            #:specular 0.35
                            #:roughness 0.3))
(define (get-random-color)
  (define color (list (+ (* (random) 1) 1)
        (+ (* (random) 0.8) 0.8)
        (+ (* (random) 0.8) 0.8)))
  (match-define (list r g b) color)
  (define heavy (max r g b))
  (list (/ r heavy) (/ g heavy) (/ b heavy)))

(define sun (set-emitted
             (parameterize ([current-color  (rgba "chocolate")])
               (sphere (pos 1 1 1) 1/5))
             (emitted "lightyellow" 10)))

(define (get-random-position)
  (pos (* (- (random) 0.4) 30)
       (* (- (random) 0.4) 30)
       (* (- (random) 0.4) 30)))

(define stars
  (time
   (combine
    (for/list ([i 500])
      (with-color (rgba (get-random-color))
        (sphere (get-random-position)
                (* 0.25 (+ (random) 0.1)))))
    (for/list ([i 500])
      (combine
       (with-color (rgba "black")
         (with-emitted (emitted (get-random-color) (* (+ 0.25 (* (random) 0.25)) 32))
           (sphere (get-random-position)
                   (* 0.25 (+ (random) 0.1)))))
       (light (get-random-position) (emitted (get-random-color) (+ 0.25 (* (random) 0.25)))))))))

(define lights+camera
  (combine (light (pos 0 1 2) (emitted "Thistle"))
           (light (pos 0 -2 -2) (emitted "PowderBlue"))
           (basis 'camera (point-at (pos 1 1 0) origin))))
 
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