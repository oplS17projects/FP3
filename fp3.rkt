#lang racket
(require db)
(require plot)

;; db connection
(define conn (sqlite3-connect #:database "my.db"))


; check iris was inserted properley, used a python script to focus on using plot, the standard racket
; db module is lacking a conveient way to to insert serveral rows 
(query-rows
 conn
 "select count(*) from iris")

(define iris-data (query-rows
                   conn
                   "select sepal_len, sepal_width, petal_len, petal_width from iris"))

; a few 3d plots to see what its like
(parameterize ([plot-title  "An R × R → R function"]
                 [plot-x-label "x"]
                 [plot-y-label "y"]
                 [plot-z-label "cos(x) sin(y)"])
    (plot3d (contour-intervals3d (λ (x y) (* (cos x) (sin y)))
                                 (- pi) pi (- pi) pi)))

(parameterize ([plot-decorations?  #f]
                 [plot3d-samples     75])
    (define (f1 θ ρ) (+ 1 (/ θ 2 pi) (* 1/8 (sin (* 8 ρ)))))
    (define (f2 θ ρ) (+ 0 (/ θ 2 pi) (* 1/8 (sin (* 8 ρ)))))
  
    (plot3d (list (polar3d f1 #:color "navajowhite"
                           #:line-style 'transparent #:alpha 2/3)
                  (polar3d f2 #:color "navajowhite"
                           #:line-style 'transparent #:alpha 2/3))))

; now to try plotting a histogram from the database
(define sepal_len_setosa (query-rows
                  conn
                  "select class, sepal_len from iris where class ='Iris-setosa'"))

(define sepal_len_versi (query-rows
                  conn
                  "select class, sepal_len from iris where class ='Iris-versicolor'"))

(define sepal_len_virginica (query-rows
                  conn
                  "select class, sepal_len from iris where class ='Iris-virginica'"))

(define sepal_width (query-rows
                  conn
                  "select class, sepal_width from iris"))

(define petal_len (query-rows
                  conn
                  "select class, petal_len from iris"))

(define petal_width (query-rows
                  conn
                  "select class, petal_width from iris"))

(plot (discrete-histogram sepal_len_setosa
                          
                           )
      #:x-label "class" #:y-label "sepal length (cm)"
                          #:title "Iris sepal length")

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

; now lets try a 3d plot of the iris principle components
; example of 3d scatter plot in racket docs
(define (runif) (- (* 2 (random)) 1))
(define (rnormish) (+ (runif) (runif) (runif) (runif)))
(define xs0 (build-list 1000 (λ _ (rnormish))))
(define ys0 (build-list 1000 (λ _ (rnormish))))
(define zs0 (build-list 1000 (λ _ (rnormish))))
(define mags (map (λ (x y z) (sqrt (+ (sqr x) (sqr y) (sqr z))))
                    xs0 ys0 zs0))
(define xs (map / xs0 mags))
(define ys (map / ys0 mags))
(define zs (map / zs0 mags))
(plot3d (points3d (map vector xs ys zs) #:sym 'dot)
          #:altitude 25)

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

(disconnect conn)