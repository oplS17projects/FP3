## plot and db
My name: Christopher Pearce

For this exploration I decided to work with plot to try visualizing some data from a database. For this example,
I decided to use the iris dataset obtained at https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data.
I used a python script to populate the database (racket db lacks a convenient way to do hundreds of inserts) and create 
the PCA so I could focus just on using plot and racket for the visualizing.

First I plotted a few of the samples in the racket documentation:

```racket
(parameterize ([plot-decorations?  #f]
                 [plot3d-samples     75])
    (define (f1 θ ρ) (+ 1 (/ θ 2 pi) (* 1/8 (sin (* 8 ρ)))))
    (define (f2 θ ρ) (+ 0 (/ θ 2 pi) (* 1/8 (sin (* 8 ρ)))))
  
    (plot3d (list (polar3d f1 #:color "navajowhite"
                           #:line-style 'transparent #:alpha 2/3)
                  (polar3d f2 #:color "navajowhite"
                           #:line-style 'transparent #:alpha 2/3))))
```
![shell image](/shell.png?raw=true "shell image")

Then I moved onto trying a 2d and 3d plot using the data from iris:

```racket
(define sepal_len_setosa (query-rows
                  conn
                  "select class, sepal_len from iris where class ='Iris-setosa'"))

(define sepal_len_versi (query-rows
                  conn
                  "select class, sepal_len from iris where class ='Iris-versicolor'"))

(define sepal_len_virginica (query-rows
                  conn
                  "select class, sepal_len from iris where class ='Iris-virginica'"))
                  
(plot (list
       (discrete-histogram sepal_len_setosa
                           #:skip 1 #:x-min 0
                           )
       (discrete-histogram sepal_len_versi
                           #:skip 1 #:x-min 55
                           #:color 2 #:line-color 2)
       (discrete-histogram sepal_len_virginica
                           #:skip 1 #:x-min 110
                           #:color 4 #:line-color 4)
       )
      #:x-label "class" #:y-label "sepal length (cm)"
      #:title "Iris sepal length")
```
This code runs three queries on the database to select the sepal length of each class of iris
and then plots three separate histograms of for each class:

![histogram image](/histogram.png?raw=true "histogram image")

Then I plotted a 3d Principle Component Analysis of the dataset:

```racket
(define pca1 (query-rows
                  conn
                  "select pc1, pc2, pc3 from iris_pca where class = 'Iris-setosa'"))

(define pca2 (query-rows
                  conn
                  "select pc1, pc2, pc3 from iris_pca where class = 'Iris-versicolor'"))

(define pca3 (query-rows
                  conn
                  "select pc1, pc2, pc3 from iris_pca where class = 'Iris-virginica'"))

; pca of iris dataset
(plot3d (list (points3d pca1 #:sym 'dot #:size 20 #:color 1)
              (points3d pca2 #:sym 'dot #:size 20 #:color 2)
              (points3d pca3 #:sym 'dot #:size 20 #:color 3))
        #:altitude 25
        #:title "3D PCA of iris dataset")
```

and generates this plot:

![pca image](/pca.png?raw=true "pca image")

<!-- Links -->
[FP1]: https://github.com/oplS17projects/FP1
[schedule]: https://github.com/oplS17projects/FP-Schedule
