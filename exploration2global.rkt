#lang racket

(require racket/draw)

;; Abstraction for list of strings
(define (make-paragraph . words) words)

;; Create a "book" (PDF)
(define (make-book title) (new pdf-dc%
                           [ interactive #f ]
                           [ use-paper-bbox #f ]
                           [ as-eps #f ]
                           [ width 592 ]
                           [ height 756 ]
                           [ output title ]))
(define (open-book book) (send* book (start-doc "hello") (start-page)))
(define (turn-page book) (begin (send* book (end-page) (start-page))
                                (set! row 0) (set! column 0)))
(define (close-book book) (send* book (end-page) (end-doc)))

(define row 0)
(define column 0)
(define (newpara)
  (begin (set! row 0) (set! column (+ column 20))))
(define (update-position w h d a)
  (if (< row 500)
      (begin (set! row (+ row w 2)) #f)
      (begin (set! row 0) (set! column (+ column h 2)) #t)))
(define (write-paragraph para book)
  (if (null? para)
      (begin (newpara)
             "OK")
      (begin (send book draw-text (car para) row column)
             (call-with-values (lambda () (send book get-text-extent (car para))) update-position)
             (write-paragraph (cdr para) book))))

;; Sample session.
;; Creates file "exploration2.pdf on my Desktop.
(define mypara (make-paragraph "Hello" "my" "name" "is" "Doug."))
(define mybook (make-book "exploration2.pdf"))
(open-book mybook)
(write-paragraph mypara mybook)
(define mypara2 (make-paragraph "This" "is" "my" "Exploration" "2."))
(write-paragraph mypara2 mybook)
(turn-page mybook)
(define mypara3 (make-paragraph
  "Lorem" "ipsum" "dolor" "sit" "amet," "consectetur" "adipiscing" "elit." "Sed" "cursus" "ante" "dapibus" "diam." 
  "Lorem" "ipsum" "dolor" "sit" "amet," "consectetur" "adipiscing" "elit." "Sed" "cursus" "ante" "dapibus" "diam."
  "Lorem" "ipsum" "dolor" "sit" "amet," "consectetur" "adipiscing" "elit." "Sed" "cursus" "ante" "dapibus" "diam."
  "Lorem" "ipsum" "dolor" "sit" "amet," "consectetur" "adipiscing" "elit." "Sed" "cursus" "ante" "dapibus" "diam."
  "Lorem" "ipsum" "dolor" "sit" "amet," "consectetur" "adipiscing" "elit." "Sed" "cursus" "ante" "dapibus" "diam."
  "Lorem" "ipsum" "dolor" "sit" "amet," "consectetur" "adipiscing" "elit." "Sed" "cursus" "ante" "dapibus" "diam."
  "Lorem" "ipsum" "dolor" "sit" "amet," "consectetur" "adipiscing" "elit." "Sed" "cursus" "ante" "dapibus" "diam."
  "Lorem" "ipsum" "dolor" "sit" "amet," "consectetur" "adipiscing" "elit." "Sed" "cursus" "ante" "dapibus" "diam."
  "Lorem" "ipsum" "dolor" "sit" "amet," "consectetur" "adipiscing" "elit." "Sed" "cursus" "ante" "dapibus" "diam."
  "Lorem" "ipsum" "dolor" "sit" "amet," "consectetur" "adipiscing" "elit." "Sed" "cursus" "ante" "dapibus" "diam."
  "Lorem" "ipsum" "dolor" "sit" "amet," "consectetur" "adipiscing" "elit." "Sed" "cursus" "ante" "dapibus" "diam."))
(write-paragraph mypara3 mybook)
(close-book mybook)