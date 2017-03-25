# FP3: Final Project Assignment 3: Exploration 2

## Plot Library
My name: Robert Cucchiara

For the second exploration I wanted to explore the plot library located in the plot_gui_lib package. My partner and I decided that we wanted to make some kind of a web page that displayed the current weather in a given region and patterns. One way of representing that data is with graphs that can show the trends in temperature and percipitation over the years in an easily digestible graphic.

The first line of code, `(plot (function sin (- pi) pi #:label "y = sin(x)"))` creates the sin wave displayed in the output below.  This was the first function I wrote to see if it displayed and how.  This plot with a function method will likely not be useful for my teams project so I did not test any other features with it.

The next bit of code I explored was plotting by points which is the most likely way the data will be displayed in our project.  This was done with the parameterize function in conjunction with a map and the plot. I tested this method with both manually creating a list of numbers and randomly generating another using `(build-list 10 (λ _ (random 1 20)))` I also tested the scale and naming the x and y axis on the graph the code for which is below.  Below that code is the output of all the code written during this exploration.  In total it is three graphs one a sin wave another a diagonal line and lastly a randomly generated graph.
```
(parameterize ([plot-width    150]
                 [plot-height   150]
                 [plot-x-label  "x axis"]
                 [plot-y-label  "y axis"])
    (define xs (build-list 10 (λ _ (random 1 20))))
    (define ys (build-list 10 (λ _ (random 1 20))))
    (list (plot (points (map vector xs ys)
                        #:x-min 0
                        #:x-max 20
                        #:y-min 0
                        #:y-max 20))))
                        
(parameterize ([plot-width    150]
                 [plot-height   150]
                 [plot-x-label  "x axis"]
                 [plot-y-label  "y axis"])
    (define xs '(1 2 3 4 5 6 7 8 9 10))
    (define ys '(1 2 3 4 5 6 7 8 9 10))
    (list (plot (points (map vector xs ys)
                        #:x-min 0
                        #:x-max 10
                        #:y-min 0
                        #:y-max 10))))
```

![fp3_output image](/fp3_output.png?raw=true "output image")
