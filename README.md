## GUI
**Robert Farinelli**

I used the GUI Library. Though the GUI library was not recommended to explore, I used it because I went into the library with a goal in mind. For the FP1 I used the database library. 
I wanted to expand upon this and look for ways to visualize the data, as me and my partner are most likely going to have a visualization command for our scripting language for our project.
So I decided to build off my previous FB1 and a table view of the database as you would see in a database IDE. I did this using the iris data set from UCI repository as we are going to be using
This data set for our project (http://archive.ics.uci.edu/ml/datasets/Iris).



```;;create a new window frame to display the data
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
(send frame show #t)```

* output 

![test image](/testimage.png?raw=true "test image")


