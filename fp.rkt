#lang racket

(require csv-reading)

(display "Hello World\n")

; Copied from csv article

(define make-food-csv-reader
  (make-csv-reader-maker
   '((separator-chars            #\|)
     (strip-leading-whitespace?  . #t)
     (strip-trailing-whitespace? . #t))))
     
(define next-row
  (make-food-csv-reader (open-input-file "baseballdatabank-master/core/Schools.csv")))

(next-row)
(next-row)