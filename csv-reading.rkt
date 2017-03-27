#lang racket

(require net/url) ;; Used to pull CSV files from Internet
(require csv-reading) ;; Used to read list of lists of data from CSV files
(require simple-xlsx) ;; Writing CSV data into usable XLSX format to be manipulated into graphs/charts

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;; Procedure call to pull CSV file from a user provided URL.
;; Extracts the file and puts the data into a list of lists

((compose csv->list get-pure-port string->url)
 "https://ichart.finance.yahoo.com/table.csv?d=6&e=1&f=2016&g=d&a=7&b=19&c=2004&ignore=.csv&s=GOOG")

;; Construct a CSV reader on the input
;; Allows for traversal row by row of the csv file using
;; (next-row) proc

(define next-row
  (make-csv-reader
   (open-input-file "goog.csv")
   '((separator-chars            #\, )
     (strip-leading-whitespace?  .1 #t)
     (strip-trailing-whitespace? .1 #t))))

;; Allows list creation of csv file directly without having to pull from URL
(csv->list (open-input-file "goog.csv"))


(define SM (csv->list (open-input-file "goog.csv")))

(define SM_header
  (car(csv->list (open-input-file "goog.csv"))))

(define SM_tail
  (cdr(csv->list (open-input-file "goog.csv"))))



(define tail (cdar SM_tail))

tail;; '("820.08" "821.93" "808.89" "814.43" "1981006")

(define SM_tail_numbers
 (map string->number tail))

SM_tail_numbers;; '(820.08 821.93 808.89 814.43 1981006)



(define l '())
(for ([i SM_tail])

  (define dates (car i))
  (define SM_tail_num (append l (map string->number (cdr i))))
  
  (define combined (cons dates SM_tail_num))
  (define temp (append l combined))
  (displayln temp)
  )



;; Uses simple-xlsx write function to write the value from CSV format to XLSX format.
;; the cells #:sheet_data will be in the format of whatever the list is containing, i.e. if it is just from
;; a CSV file, then the cells will be formatted in strings

(let ([xlsx (new xlsx%)])
  (send xlsx add-data-sheet
       #:sheet_name "DataSheet"
       #:sheet_data SM)
 
 (write-xlsx-file xlsx "test.xlsx"))
