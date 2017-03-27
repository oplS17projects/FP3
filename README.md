# FP3: Final Project Assignment 3: Exploration 2
Due Sunday, March 26, 2017

## GUI Library
My name: Mike Zurawski

Our team needed to create some sort of GUI for our project, so I explored the gui library (I realize it's not recommended).
What I basically did was create a simple user interface that will look close to what the final product may look like.
All this UI does is take input from the user and spit out a recipe with a link(right now im just using a static list).

```
(define data (list (list "egg" "chicken" "bacon" "apple")
                   (list "cheese" "garlic" "egg" "sugar")
                   (list "ham" "x" "english muffin" "ground cinnamon")
                   (list "x" "x" "x" "nutmeg")
                   (list "Ham and cheese omelet" "Grilled chicken breast" "Bacon and egg sandwhich" "Apple pie") ;; recipe
                   (list "http://www.food.com/recipe/ham-cheese-omelette-151744"
                         "http://www.onceuponachef.com/recipes/perfectly-grilled-chicken-breasts.html"
                         "http://www.food.com/recipe/bacon-and-egg-sandwich-56191"
                         "https://www.pillsbury.com/recipes/perfect-apple-pie/1fc2b60f-0a4f-441e-ad93-8bbd00fe5334"))) ;; url


(send table set (list-ref data 0) (list-ref data 1) (list-ref data 2) (list-ref data 3) (list-ref data 4)
      (list-ref data 5))

;; http://stackoverflow.com/questions/16249705/get-the-selected-text-field-in-a-racket-gui
(define my-text-field%
  (class text-field%
    (super-new)
    (define/override (on-focus on?)
      (when on? (printf "~a\n" (send this get-label))))))

;;(define frame (new frame% [label "Frame"]))
(define field-1 (new my-text-field% [label "Food Item 1"] [parent frame]))
(define field-2 (new my-text-field% [label "Food Item 2"] [parent frame]))
(define field-3 (new my-text-field% [label "Food Item 3"] [parent frame]))
(define field-4 (new my-text-field% [label "Food Item 4"] [parent frame]))
```
![interface](/interface.png?raw=true "interface")
