#lang racket
(require web-server/servlet
         web-server/servlet-env)

(define root (current-directory))

(define x (list "dog" "cat" "wolf" "horse" "cow" "bear"))
(define y (filter (lambda (x) (> (string-length x) 3)) x))

(define (render-as-itemized-list fragments)
  `(ul ,@(map render-as-item fragments)))

(define (render-as-item a-fragment)
  `(li ,a-fragment))
 
(define (fp3-app req)
  (response/xexpr
   `(html (head (title "FP3")
                (link ((rel "stylesheet")
                       (href "/fp3.css")
                       (type "text/css")))
                (link ((rel "stylesheet")
                       (href "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css")
                       (type "text/css")))
                (script ((src "https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js")))
                (script ((src "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js")))
                (script ((src "/fp3.js"))))
          (body (div ((class "jumbotron text-center"))
                     (h1 "FP3 Test Driving A Racket Library")
                     (p "This is a test drive of the racket library web-server/servlet-env"))
                (div ((class "container"))
                     (div ((class "row"))
                          (div ((class "col-xs-6 col-centered text-center"))
                               (h2 "List Before Filter")
                               (p "This represents a list of animals before filtering")
                               ,(render-as-itemized-list x))
                          (div ((class "col-xs-6 col-centered text-center"))
                               (h2 "List After Filter")
                               (p "Resulting list of animals with string lengths greater than 4")
                               ,(render-as-itemized-list y))))))))
 
;;(serve/servlet fp3-app
;;               #:servlet-path "/fp3")

(serve/servlet fp3-app
                 #:extra-files-paths
                 (list
                  (build-path root "css")
                  (build-path root "js")))
