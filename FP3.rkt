#lang racket
(require net/head)


; These three line of codes allows you to get a certain info in the address that is parsed
(define h
  (extract-addresses "Hussain Dar <dar@localhost>" 'name))
(car h)
(length h)

(define s
  (extract-addresses "Sim Dy <SimDy@localhost>" 'address))
(car s)
(length s)

(define f
  (extract-addresses "Fred Martin <doe@localhost>" 'full))
(car f)
(length s)