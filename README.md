## Csv-reading
My name: Jonathan Murphy

I wanted to play around with the CSV file library, I intend to use CSV files in the final project to read and store data.

I borrowed the following code from the racket documents

~~~~
(define make-food-csv-reader
  (make-csv-reader-maker
   '((separator-chars            #\|)
     (strip-leading-whitespace?  . #t)
     (strip-trailing-whitespace? . #t))))

(define next-row
  (make-food-csv-reader (open-input-file file)))
~~~~

This let me work my way through the csv file. I found an example csv data [here](http://www.baseball-reference.com/managers/coxbo01.shtml) and included the file "baseballdatabank-master/core/Schools.csv" that I mainly used for data.

I did 2 seperate function, the first being '(print-all)' which just printed out the raw data. All the output is in print-all.txt, excerpt here:

~~~~
(casierr,Sierra College,Rocklin,CA,USA)
(casiski,College of the Siskiyous,Weed,CA,USA)
(casjcco,San Jose City College,San Jose,CA,USA)
(casjdjc,San Joaquin Delta College,Stockton,CA,USA)
(caskyli,Skyline JC,San Bruno,CA,USA)
(casmjco,Santa Monica College,Santa Monica,CA,USA)
(casolan,Solano Community College,Fairfield,CA,USA)
(casrjco,Santa Rosa Junior College,Santa Rosa,CA,USA)
(caswjco,Southwestern College,Chula Vista,CA,USA)
(catafjc,Taft College,Taft,CA,USA)
(catawba,Catawba College,Salisbury,NC,USA)
(catholic,Catholic University of America,Washington,DC,USA)
(caventu,Ventura College,Ventura,CA,USA)
(cawhjco,West Hills College,Coalinga,CA,USA)
~~~~

The second function I made, I named statement and had it print out a number of statements. I first make a helper function named 'nth-item' that takes in the csv object and an index number and returns the correct value.

~~~~
(define (nth-item csv2list num)
  (list-ref (car (csv->list (car csv2list))) num))
~~~~

So with (nth-item '("adrianmi,Adrian College,Adrian,MI,USA") 3), you get "MI".

So I wrote:


~~~~
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
~~~~
Full output is in statement.txt and an example is in the following image.

![Output](FP3.png?raw=true "test image")
