#lang racket/gui
(require db)

(define db-file "C:/Users/Bobby/Documents/OPL/Final_Project/FP3/test_iris.db")

(define dbconn (sqlite3-connect #:database db-file))

(define dbInfo (connection-dbsystem dbconn))

(define (ToList thing)
  (foldr (lambda (x y) (cons (vector->list x) y)) '() thing))

(define (to-strings lists)
 (foldr (lambda (x y) (cons (map (lambda (n) (if (number? n) (number->string n) n)) x) y)) '() lists))
  

(define dataset (ToList (query-rows dbconn "SELECT * FROM dataset")))

(define strDataset (to-strings dataset))

(define names (foldr (lambda (x y) (cons (car x) y)) '() strDataset))

(define Sepal_length (foldr (lambda (x y) (cons (car (cdr x)) y)) '() strDataset))

(define Sepal_width (foldr (lambda (x y) (cons (car (cdr (cdr x))) y)) '() strDataset))

(define Petal_length (foldr (lambda (x y) (cons (car (cdr (cdr (cdr x)))) y)) '() strDataset))

(define Petal_Width (foldr (lambda (x y) (cons (car (cdr (cdr (cdr (cdr x))))) y)) '() strDataset))

(define DisplayData (list names Sepal_length Sepal_width Petal_length Petal_Width))


;;create a new window frame to display the data
(define frame (new frame% 
                  [label "Iris_data_set"]
                  [width 800]
                  [height 600]
                  ))

;;Create the table in 
(define table (new list-box%
                 [parent frame]
                 ;;set where the dat comes from
                 [choices (list )]
                 [label "Test_data"]
                 ;;set sup the table sytle
                 [style (list 'single 'column-headers 'variable-columns)]
                 ;;label the rows
                 [columns (list "Class" "Sepal_length" "Sepal_width" "Petal_length" "Petal_Width")]))

(define data (list (list "1" "2" "3")
                   (list "4" "5" "6")
                   (list "6" "8" "9")))


;;fill the Table with values 
(send table set (list-ref DisplayData 0) (list-ref DisplayData 1) (list-ref DisplayData 2) (list-ref DisplayData 4) (list-ref DisplayData 3));--> Works but needs to be aple to handle variable lengtho of data

;; display the GUI
(send frame show #t)