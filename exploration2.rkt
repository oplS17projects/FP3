#lang racket

(require racket/draw)

;; Abstraction for list of strings as a paragraph
(define (make-paragraph . words) words)

;; BEGIN MAKE-BOOK
;; Closure for a book
(define (make-book title)
  
  ;; Constuctor (more or less)
  (define book
    (new pdf-dc%
         [ interactive #f ]
         [ use-paper-bbox #f ]
         [ as-eps #f ]
         [ width 592 ]
         [ height 756 ]
         [ output title ]))

  ;; Page management
  (define (open-book) (send* book (start-doc "hello") (start-page)))
  (define (turn-page) (begin (send* book (end-page) (start-page))
                                  (set! row 0) (set! col 40)))
  (define (close-book) (send* book (end-page) (end-doc)))

  ;; Variables for keeping track of position
  (define row 0)
  (define col 40)
  (define (newpara)
    (begin (set! col 40) (set! row (+ row 40))))
  (define (update-position w h d a)
    (if (< col 500)
        (begin (set! col (+ col w 2)) #f)
        (begin (set! col 0) (set! row (+ row h 2)) #t)))

  ;; Writes a paragraph to the book
  (define (write-paragraph para)
    (if (null? para)
        (newpara)
        (begin (send book draw-text (car para) col row)
               (call-with-values (lambda () (send book get-text-extent (car para))) update-position)
               (write-paragraph (cdr para)))))

  ;; Dispatch function
  (lambda (m)
    (cond ((eq? m 'open) open-book)
          ((eq? m 'turn-page) turn-page)
          ((eq? m 'close) close-book)
          ((eq? m 'write) write-paragraph)
          (else (error "Unknown request")))))
;; END OF MAKE-BOOK

;; Sample session.
;; Creates file "exploration2.pdf in cwd.
(define mypara (make-paragraph "Hello" "my" "name" "is" "Doug."))
(define mypara2 (make-paragraph "This" "is" "my" "Exploration" "2."))
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