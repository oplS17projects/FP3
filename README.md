# FP3: Final Project Assignment 3: Exploration 2
Due Sunday, March 26, 2017

This assignment is the same as [FP1], except definitely choose a library that you expect to use for your full project.

You will be in your team before you complete this assignment. You and your teammate(s) must coordinate to (1) both choose libraries relevant to your project, and (2) each choose a different library.

The report template is below, beginning with "Library Name Here."

## How to Prepare and Submit This Assignment

1. To start, [**fork** this repository][forking]. 
1. Add your `.rkt` Racket source file(s) to the repository. 
1. Add any images to the repository.
1. Modify the `README.md` file and [**commit**][ref-commit] changes to complete your report.
1. Ensure your changes (report in `md` file, added `rkt` file(s), and images) are committed to your forked repository.
1. [Create a **pull request**][pull-request] on the original repository to turn in the assignment.

## plot and db
My name: Christopher Pearce

Write what you did!
Remember that this report must include:

For this exploration I decided to work with plot to try visualizing some data from a database. For this example,
I decided to use the iris dataset obtained at https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data.
I used a python script to populate the database (racket db lacks a convient way to do hundreds of inserts) and create 
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


* a narrative of what you did
* highlights of code that you wrote, with explanation
* output from your code demonstrating what it produced
* at least one diagram or figure showing your work

The narrative itself should be no longer than 350 words. 

You need at least one image (output, diagrams). Images must be uploaded to your repository, and then displayed with markdown in this file; like this:

![test image](/testimage.png?raw=true "test image")

You must provide credit to the source for any borrowed images.

Code should be delivered in two ways:

1. Full files should be added to your version of this repository.
1. Key excerpts of your code should be copied into this .md file, formatted to look like code, and explained.

<!-- Links -->
[FP1]: https://github.com/oplS17projects/FP1
[schedule]: https://github.com/oplS17projects/FP-Schedule
[markdown]: https://help.github.com/articles/markdown-basics/
[forking]: https://guides.github.com/activities/forking/
[ref-clone]: http://gitref.org/creating/#clone
[ref-commit]: http://gitref.org/basic/#commit
[ref-push]: http://gitref.org/remotes/#push
[pull-request]: https://help.github.com/articles/creating-a-pull-request
