#lang racket
(require json)
;Sample Json input, 2 kids each with 3 different interests
(define favorites2 (with-input-from-string
   "{
    \"Brandon\":[{
            \"Animal\": \"Elephant\",
            \"Color\": \"Blue\",
            \"Food\": \"Pizza\"
    }],
    \"Serey\":[{
            \"Animal\": \"Sloth\",
            \"Color\": \"Red\",
            \"Food\": \"Hamburger\"
    }]
    }"
    (λ () (read-json))))

;takes a kid by name, returns favorite animal
(define (getanimal kid)
  (hash-ref (car (hash-ref favorites2 kid)) 'Animal))

;takes a kid by name, returns favorite animal
(define (getcolor kid)
  (hash-ref (car (hash-ref favorites2 kid)) 'Color))

;takes a kid by name, returns favorite animal
(define (getfood kid)
  (hash-ref (car (hash-ref favorites2 kid)) 'Food))

;takes 2 kids by name and compares their favorite things
(define (comparekids kid1 kid2)
  (printf "Brandon likes ~s's, the color ~s and ~s while Serey likes ~s's, the color ~s and ~s."
          (getanimal kid1) (getcolor kid1) (getfood kid1)
          (getanimal kid2) (getcolor kid2) (getfood kid2))
  )