#lang racket

(require 2htdp/image)

(define (make-shape-list shape rad md col)
  (if (<= rad 0)
      '()
      (cons
       (shape rad md col)
       (make-shape-list shape (- rad 10) md col))))

(define shape-list1
  (make-shape-list circle 100 "outline" "red"))

(define (foldl-circle shape-list)
  (foldl (lambda (a result) (underlay result a))
         (circle 0 "outline" "red")
         shape-list1))

(define background1
  (rectangle 150 300 "solid" "red"))

(define background2
  (rectangle 150 300 "solid" "blue"))

(define real-background
  (overlay/offset background1 150 0 background2))

(define circle-logo
  (add-line
   (scene+curve
    (circle 150 "outline" "black")
    50 40 0 1/3
    250 260 0 1/3
    "white")
   48 260 150 150 "white"))

(define racket-logo
  (overlay circle-logo real-background))

(define (save-the-image image filename)
  (save-image image filename))
  