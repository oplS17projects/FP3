# FP3: Final Project Assignment 3: Exploration 2
Due Sunday, March 26, 2017
data/collection library
My name: Leon Kang

I started by thinking about what kinds of data structures could possibly represent cards, and in this FP3 I decided to test out the vectors in the data/collection library. I was able to represent cards as pairs and have a vector of cards from which I could draw random cards from. I ended up having trouble being taking out a card from the deck after i had drawn a random card.
```
;This was the representation of a single card which provided abstraction to the cons pair
(define (card suit rank)
  (cons suit rank))
```
```
;This part is where I would create a deck from a list. I attempted to use map to reduce typing but it seems regular map doesn't
;play well with this data structure
(define (createDeck)
  (list->vector (list (card 0 0)
                      (card 0 1)
                      (card 0 2)
                      .
                      .
                      .
                      (card 4 12)
```
```
;This code takes in the deck that I implemented and then draws a single random card from it using
;the library functions from data/collection
(define (drawCard deck)
.
.
(set! currentCard (vector-ref deck (vector-member (card suit rank) deck)))
.
  currentCard)
  ))
  ```
![FP3](/FP3.jpg?raw=true "FP3")

Overall, I tried representing the deck of cards with a couple different libraries and I may end up changing it again until it feels as though I have a proper representation to work with.
