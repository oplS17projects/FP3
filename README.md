## My Library: Plot: JSON
My name: Brandon Karl

Serey and I intend to use API data in our project so I thought it would be useful to learn how to parse this JSON data in Racket. First I learned about what JSON was and made a sample JSON file in my program that keeps track of a few things Serey and I like. For example
```
(define favorites2 (with-input-from-string
   "{
    \"Brandon\":[{
            \"Animal\": \"Elephant\",
            \"Color\": \"Blue\",
            \"Food\": \"Pizza\"
    }],
    \"Serey\":[{
            \"Animal\": \"Sloth\",
            \"Color\": \"Red\",
            \"Food\": \"Hamburger\"
    }]
    }"
    (λ () (read-json))))
```
This code takes a JSON file, in this case a string and converts it into a format where the information in here can be looked up. Running this defines the favorites2 to
```
'#hasheq((Serey
          .
          (#hasheq((Food . "Hamburger") (Animal . "Sloth") (Color . "Red"))))
         (Brandon
          .
          (#hasheq((Food . "Pizza") (Animal . "Elephant") (Color . "Blue")))))
```
I then made some helper functions to get the data by entering one of the names 
```
;takes a kid by name, returns favorite animal
(define (getanimal kid)
  (hash-ref (car (hash-ref favorites2 kid)) 'Animal))

;takes a kid by name, returns favorite animal
(define (getcolor kid)
  (hash-ref (car (hash-ref favorites2 kid)) 'Color))

;takes a kid by name, returns favorite animal
(define (getfood kid)
  (hash-ref (car (hash-ref favorites2 kid)) 'Food))
```
The inner hash-ref returns a list where the first element is all the data for the kid you are looking at is stored, the second element is empty, we we just want the car of the list. The outer href-then takes the data for whichever kid was entered and looks for the right data, either Animal, Color or Food.

Lastly I made a handly little function that takes 2 kids and compared their favorite things. I looked up how to print to the screen and it was just like in c.
```
;takes 2 kids by name and compares their favorite things
(define (comparekids kid1 kid2)
  (printf "Brandon likes ~s's, the color ~s and ~s while Serey likes ~s's, the color ~s and ~s."
          (getanimal kid1) (getcolor kid1) (getfood kid1)
          (getanimal kid2) (getcolor kid2) (getfood kid2))
  )
```

Here is some example output:

![output](/Plotting2graphs.png?raw=true "Plotting 2 Graphs")

