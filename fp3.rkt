#lang racket 
(require racket/gui)

(define stats (make-hash))

(define tPoints 100)

(define (changePoints x)
  (set! tPoints x))

(define (resetPoints)
  (changePoints 100))

  
(define (initStats table)
  (hash-set! table "Strength" (random 1 20))
  (hash-set! table "Dexterity" (random 1 20))
  (hash-set! table "Intelligence" (random 1 20))
  (hash-set! table "Wisdom" (random 1 20))
  (hash-set! table "Constitution" (random 1 20))
  (hash-set! table "Charisma" (random 1 20))
  )

(initStats stats)
(define frame (new frame% [label "Player Stats"]
                          [width 900]
                          [height 900]))


(define amazon (read-bitmap "/home/a/Downloads/Class/Comp3010/fp3/FP3/amazon.png"))

(define (getStatVal statKey)
  (hash-ref stats statKey))

(define (statString x)
  (string-append x ": "(number->string (getStatVal x))))

(new canvas% [parent frame]
     [paint-callback
     (λ (canvas dc)
       (send dc draw-bitmap amazon 50 100)
       (send dc draw-text (statString "Strength") 700 50)
       (send dc draw-text (statString "Dexterity") 700 100)
       (send dc draw-text (statString "Intelligence") 700 150)
       (send dc draw-text (statString "Wisdom") 700 200)
       (send dc draw-text (statString "Constitution") 700 250)
       (send dc draw-text (statString "Charisma") 700 300))])


(send frame show #t)