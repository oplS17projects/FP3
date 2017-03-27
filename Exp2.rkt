#lang racket

(require simple-xlsx)

(define file-name "test.xlsx")
(define sheet-name "Sheet1")

(let ((test (new xlsx%)))
  (send test add-data-sheet
        #:sheet_name sheet-name
        #:sheet_data '(("Object 1" "Data A" "Data B" "Data C")
                       ("Object 2" "Data A" "Data B" "Data C")
                       ("Object 3" "Data A" "Data B" "Data C")))
  (write-xlsx-file test file-name)
  )

(with-input-from-xlsx-file file-name
  (lambda (test)
    (load-sheet sheet-name test)
    (printf "~a\n" (get-sheet-rows test))
    (printf "~a\n" (get-cell-value "A1"  test))
    ))


(define sheet-data (sheet-name-rows file-name sheet-name))

(define (get-row row sheet)
  (cond ((eq? '() sheet) sheet)
        ((= row 0) (car sheet))
        (else (get-row (- row 1) (cdr sheet)))
        ))

(define (get-element column row-data)
  (cond ((eq? '() row-data) row-data)
        ((= column 0) (car row-data))
        (else (get-element (- column 1) (cdr row-data)))
        ))

(define (get-column column sheet)
  (define (nth-element n)
    (define (nth-element-iter count proc)
     (if (= count 0) proc
         (nth-element-iter (- count 1) (lambda (n) (proc (cdr n))))
         ))
    (nth-element-iter n car))
  (map (nth-element column) (filter
                             (lambda (n) (> (length n) column)) sheet))
  )
 
  