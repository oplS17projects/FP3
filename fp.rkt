#lang racket

(require csv-reading)
(require dyoo-while-loop)

; Copied from csv article
; docs.racket-lang.org/csv-reading/index.html

(define make-food-csv-reader
  (make-csv-reader-maker
   '((separator-chars            #\|)
     (strip-leading-whitespace?  . #t)
     (strip-trailing-whitespace? . #t))))
     
(define next-row
  (make-food-csv-reader (open-input-file "baseballdatabank-master/core/Schools.csv")))

(define next-row2
  (make-food-csv-reader (open-input-file "baseballdatabank-master/core/Schools.csv")))

;end copy

(define (nth-item csv2list num)
  (list-ref (car (csv->list (car csv2list))) num))

(define (print-all) 
  (define var (next-row))

  (while (not (empty? var))
         (begin (display var)
                (display "\n")
                (set! var (next-row)))))

;'("schoolID,name_full,city,state,country")

(define (statement)
  (next-row2)
  (define var (next-row2))
  
  (while (not (empty? var))
         (begin (display "The school ")
                (display (nth-item var 1))
                (display " is located in ")
                (display (nth-item var 2))
                (display ", ")
                (display (nth-item var 3))
                (display " in ")
                (display (nth-item var 4))
                (display ".\n")
                (set! var (next-row2)))))
