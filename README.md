# FP3: Final Project Assignment 3: Exploration 2

## Racket/Draw
My name: **Doug Salvati**

I used the `draw` library in order to learn how to export to PDF file, which is a feature that will be useful for showing the results of our final project.  In this example, I create a closure representing a book, with methods that allow the user to write paragraphs into the book.  The result is a PDF file posted in the current working directory.

An interaction looks like this:
```
(define myBook (make-book "exploration2.pdf"))
((myBook 'open))
((myBook 'write) mypara)
((myBook 'write) mypara2)
((myBook 'write) mypara3)
((myBook 'turn-page))
((myBook 'write) mypara3)
((myBook 'write) mypara3)
((myBook 'write) mypara3)
((myBook 'close))
```
Here is a look at the first page of the resulting [output](exploration2.pdf) before the `'turn-page` command:
![output image](output_image.png?raw=true "output image")

To open the book, close the book, and turn the page, special calls are made to `draw` procedures that manage the PDF.
Write, on the other hand, is a procedure I made to write a paragraph (an object created using `make-paragraph`) to the book:
```
(define (write-paragraph para)
    (if (null? para)
        (newpara)
        (begin (send book draw-text (car para) col row)
               (call-with-values (lambda () (send book get-text-extent (car para))) update-position)
               (write-paragraph (cdr para)))))
```
It is a tail-recursive procedure which prints the word to the file, increments the position of the cursor based on the length of the word, and then recurses on the rest of the words.  At the end, a special update function `newpara` is called to set up spacing and indentation for the next paragraph the user may write.

All of the position updating is done using variables and procedures I wrote.  When I started with [`exploration2global.rkt`](exploration2global.rkt), all variables and functions needed to keep track of where to write in the file were in the global environment.  However, I quickly realized that only a few of the functions: `open-book`, `close-book`, `turn-page`, and `write-paragraph`, were useful to the user.  Furthermore, if you tried to write two books at once, the global variables used by the functions would get all corrupted.  So, I re-implemented the assignment in [`exploration2.rkt`](exploration2.rkt) using a closure and a dispatch function, similar to the bank accounts in SICP and PS4.  This is a better model, and it makes my sample interactive session simpler for the user.  This is how the four possible commands are processed:
```
(lambda (m)
    (cond ((eq? m 'open) open-book)
          ((eq? m 'turn-page) turn-page)
          ((eq? m 'close) close-book)
          ((eq? m 'write) write-paragraph)
          (else (error "Unknown request")))))
```
Due to the use of `lambda` rather than `define`, this is actually the return value for `make-book`, meaning a book is actually a procedure!

Note that paragraphs are made to be list of words, for instance:
```
(define mypara (make-paragraph "We're" "all" "mad" "here."))
```
It may seem cumbersome to do this way, but in the end we will be drawing a list of objects which contain musical notes, so this format will be more natural down the road.
