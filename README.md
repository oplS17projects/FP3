#lang racket
(require picturing-programs)
(require test-engine/racket-tests)
(require 2htdp/image)

(define arrow .)
(define PIANO .)
(define PIANO2
  (overlay/align "left" "top" PIANO  (circle (image-height PIANO) "solid" "white")))

(check-expect (move arrow) (rotate (* -1 180) arrow))
(define (move im) (rotate (* -1 180) im))


(check-expect (key-press PIANO "up") PIANO)
(check-expect (key-press PIANO "down") (stop-with arrow))
(define (key-press im k)
  (cond [(equal? k "down") (move arrow)]
        [else im]))
(big-bang PIANO2
          (to-draw show-it)
          (on-key key-press))