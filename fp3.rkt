#lang racket

;;plot library
(require plot)
(require plot/utils)

;;open graphs in new window
(plot-new-window? #t)

;; sample graph from plot documentation
(plot (function sin (- pi) pi #:label "y = sin(x)"))



;; graphing multiple lines of data in one graph using a list
(define (compare-car-mileage)
(plot (list (axes)
            (function (lambda (x) (+ (* -1/2 x) 80)) #:color 2 #:label "Honda")
            (function (lambda (x) (+ (* -1/3 x) 70)) #:color 3 #:label "Toyota")
            (function (lambda (x) (+ (* -1/6 x) 75)) #:color 4 #:label "Ford"))
      ;; add custom title and x/y labels
      #:title "Sample car comparison graph"
      #:x-label "age (years)" #:y-label "fuel efficency (mpg)"
      #:x-min 0
      #:x-max 35
      #:y-min 40
      #:y-max 100))

(compare-car-mileage)


;; sample bar graph
(plot (list (discrete-histogram
               (list #(Honda 90)
                     #(Toyota 67)
                     #(Ford 74)
                     )))
        #:x-label "Vehicle manufacturer" #:y-label "Time (Days)"
        #:title "Days before maintenance required on vehicle"
        #:x-min 0
        #:x-max 5
        #:y-min 0
        #:y-max 100)




(define car1
      (list #(0 100) #(5 140) #(10 135) #(15 161) #(20 172) #(25 183)))
(define car2
      (list #(0 90) #(5 120) #(10 133) #(15 142) #(20 150) #(25 171)))
(define car3
      (list #(0 50) #(5 60) #(10 70) #(15 100) #(20 150) #(25 190)))

(plot (list (axes)
            (lines car1 #:color 5 #:label "Honda")
            (points car1 #:color 5)
            (lines car2 #:color 6 #:label "Toyota")
            (points car2 #:color 5)
            (lines car3 #:color 7 #:label "Ford")
            (points car3 #:color 5))
                   #:x-label "age (years)"
                   #:y-label "cost ($)"
                   #:title "Monthly maintenance cost over time"
                   #:x-max 30
                   #:y-min 0
                   #:y-max 200)