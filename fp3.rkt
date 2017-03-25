#lang racket
(require plot)

(plot (function sin (- pi) pi #:label "y = sin(x)"))


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
         ; (plot (points (map vector xs ys)
         ;               #:x-min 0 #:x-max 10
         ;               #:y-min 0 #:y-max 10))))

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

