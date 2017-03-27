# FP3: Final Project Assignment 3: Exploration 2

## web-server/sevlet-env
My name: Scott Mello


I used the web-server/sevlet-env library to render an html page using racket,
and then served up the rendered html to the racket server running on my
local machine, which in turn displayed it to the browser.

The html page consisted of two unordered lists. The first list is a list of
animal names. The second list is the result of using filter to filter out all
animals names less than four characters in length.

For styling the page, some custom css and javscript were used. I also used 
bootstrap to make the page responsive, as well as bootsraps built in styling. 


#### code to render the html

```

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

```

#### original list and filtered list definitions

```

(define x (list "dog" "cat" "wolf" "horse" "cow" "bear"))
(define y (filter (lambda (x) (> (string-length x) 3)) x))

```

#### creates a single x-expression representing ul and li html elements given many x-expressions (a list)

```

(define (render-as-itemized-list fragments)
  `(ul ,@(map render-as-item fragments)))

(define (render-as-item a-fragment)
  `(li ,a-fragment))

```

#### Output

![fp3 image](/FP3.png?raw=true "fp3 image")