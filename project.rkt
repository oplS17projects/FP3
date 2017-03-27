#lang racket

(require net/url)
(require racket/gui)

(define app_id  "app_id: 7b58b972")
(define app_key "app_key: b70c1d9cbbc48700a36ac012292c533c")


(define frame (new frame% [label "Word Search"]))

;;Make a text field in frame
(define word-field (new text-field% [parent frame]
                [label "word:"]))
 
; Make a button in the frame
(new button% [parent frame]
             [label "Search"]
             ; Callback procedure for a button click:
             [callback (lambda (button event)
                         (search-word (send word-field get-value)))])
 
; Show the frame by calling its show method
(send frame show #t)


(define (search-word word)
  (define url  (string->url (string-append "https://od-api.oxforddictionaries.com:443/api/v1/entries/en/" word)))
  (define header (list app_id app_key))
  (define my-port (get-pure-port url header))
  (display-pure-port my-port))
