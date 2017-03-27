# FP3: Final Project Assignment 3: Exploration 2
DUE Sunday, March 26, 2017

## My Library: plot

My name: Devon Hills


### What I Did:

My partner and I decided to create an application that monitors vehicle maintenance statistics and vehicle information in order for the owner to know when they should expect to need repairs/ and the costs over time of such maintenance. We will be using both database libraries and plot libraries. For FP3 I am exploring the plot library to get an idea of the various functions and utilities available for displaying all the information we will be gathering.

I began by simply plotting the sample graph given in the plot library to ensure everything was working properly.
```
(plot (function sin (- pi) pi #:label "y = sin(x)"))
```

I then started by creating a custom graph using a list to post multiple lines of data at once. I used a simple y = mx + b formula for the line slopes, as the goal was just to create multiple data lines in one graph. I experimented with the various plot parameters to change the x and y bounds, labels, colors, size, etc.
```
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
```
Which produces:

![car1](/car1.png?raw=true "car1")


I then made a similar graph, but using custom defined coordinates rather than a slope, which would be more along the lines of data we would retrieve from our database. I created 3 vehicles which stored the coordinate information:
```
(define car1
      (list #(0 100) #(5 140) #(10 135) #(15 161) #(20 172) #(25 183)))
(define car2
      (list #(0 90) #(5 120) #(10 133) #(15 142) #(20 150) #(25 171)))
(define car3
      (list #(0 50) #(5 60) #(10 70) #(15 100) #(20 150) #(25 190)))
```

And then graphed them similarly to above, but passing the car information to the lines and points functions:
```
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
```

Which produces:

![car2](/car2.png?raw=true "car2")


Finally, I created a bar graph, which could be used to portray different types of information:
```
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
```

Which produces:

![car3](/car3.png?raw=true "car3")



NOTE: All of the above data is arbitrary and nonsensical and was made up solely to test plot features. When we implement our program, data will be obtained through our stored information.
