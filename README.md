
Libary: simple-xlsx

My name: Alexander Pilozzi

I chose the simple xlsx library as xlsx files are useful forms of input and output. For our project, we are considering using them primarily as a source of input so that is what I focused on.

For the sake of the exploration, I created an xlsx file through racket using the following code:
``` racket
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
```
Which first creates an xlsx object, then adds a data-sheet named “Sheet1” to the object and fills it with the appropriate data, which can be either a number or a string. Data is handled in a list-of-lists format, which each sub-list corresponding to one row; these rows must be of equal length or the sheet cannot be created. The final procedure creates the actual xlsx file itself.
The entirety of the data contained within a given sheet can be acquired with the sheet-name-rows procedure as shown:
``` racket
(define sheet-data (sheet-name-rows file-name sheet-name))
```
Which outputs the data in the same list-of-lists format:
``` racket
> sheet-data
'(("Object 1" "Data A" "Data B" "Data C")
  ("Object 2" "Data A" "Data B" "Data C")
  ("Object 3" "Data A" "Data B" "Data C"))
```
Additionally, the library includes other reading procedures for use within the with-input-from-xlsx-file procedure.
These include the get-sheet-rows procedure, which gets data in a similar manner to the sheet-name-rows procedure and the get-cell-value, which allows the value of a specific cell to be queried.
```Racket
(with-input-from-xlsx-file file-name
  (lambda (test)
    (load-sheet sheet-name test)
    (printf "~a\n" (get-sheet-rows test))
    (printf "~a\n" (get-cell-value "A1" test))
    ))
```
Outputs:
``` racket
((Object 1 Data A Data B Data C) (Object 2 Data A Data B Data C) (Object 3 Data A Data B Data C))
Object 1
```
Given the somewhat limited nature of these accessor procedures, I opted to create several procedures to manipulate the data structure given by the sheet-name-rows procedure.
The first was a procedure that extracts a specific row from the list:
``` racket
(define (get-row row sheet)
  (cond ((eq? '() sheet) sheet)
        ((= row 0) (car sheet))
        (else (get-row (- row 1) (cdr sheet)))
        ))
```
The procedure is iterative and effectively “consumes” a row from the input list each iteration until it reaches the desired row, which is returned. If the sheet given is empty, it returns the empty list.
For example, Inputting:
``` racket
(get-row 1 sheet-data)
```
Outputs:
``` racket
'("Object 2" "Data A" "Data B" "Data C")
```
A second procedure allows for the specific element of a given row to be obtained.
``` racket
(define (get-element column row-data)
  (cond ((eq? '() row-data) row-data)
        ((= column 0) (car row-data))
        (else (get-element (- column 1) (cdr row-data)))
        ))
```
This function works in a similar manner to the get-row function, as it consumes elements in the row until the desired one is reached, at which point it returns that value. This function is intended to be used in tandem with the get-row function.
For example, the input:
``` racket
(get-element 1 (get-row 1 sheet-data))
```
Outputs:
``` racket
"Data A"
```
A final procedure outputs the entirety of a given column.
``` racket
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
```
Given the format of the list-of-lists, I opted to use a map instead of using the get-element procedure. The nth-element procedure generates the series of car/cdrs needed to reach the desired element, which is used in the map. The sheet given is first filtered in case the input file has rows of unequal length, so the presence of rows that do not have the desired column does not cause errors. The output list does not account for the rows that are filtered out, however.
For example, the inputs:
``` racket
(get-column 0 sheet-data)
(get-column 1 sheet-data)
```
Output:
``` racket
'("Object 1" "Object 2" "Object 3")
'("Data A" "Data A" "Data A")
```
