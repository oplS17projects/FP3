#lang racket
(require 2htdp/image)


(define (target x)
  (if (= x 0) empty-image
      (overlay
       (target (- x 1))
       (circle (* x 50) "solid" (if (even? x)
                                    "white"
                                    "red") ))))
(define (smiley-face)
  (add-curve
   (overlay/offset
    (circle 20 "solid" "black")
    -35 25
    (overlay/offset
     (circle 20 "solid" "black")
     35 25
     (circle 100 "solid" "yellow")))
   40 130 -45 1/3
   160 130 45 1/3
   (make-pen "black" 15 "solid" "round" "round")))

(define (spiral x)
  (if (= x 0) empty-image
      (overlay/align
       (cond ((= (remainder x 4) 0) "left")
             ((= (remainder x 4) 1) "left")
             ((= (remainder x 4) 2) "right")
             ((= (remainder x 4) 3) "right"))
       (cond ((= (remainder x 4) 0) "top")
             ((= (remainder x 4) 1) "bottom")
             ((= (remainder x 4) 2) "top")
             ((= (remainder x 4) 3) "bottom"))
       (spiral (- x 1))
       (circle (* x 20) "solid"
               (cond ((= (remainder x 4) 0) "green")
                     ((= (remainder x 4) 1) "blue")
                     ((= (remainder x 4) 2) "red")
                     ((= (remainder x 4) 3) "yellow"))))))

       
       
               
  
                  