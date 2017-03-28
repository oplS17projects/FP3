#lang racket

(require net/url)
(require xml)

(define myurl (string->url "https://www.barchart.com/stocks/signals/top-bottom"))
(define myport (get-pure-port myurl))
(extract-pcdata (display-pure-port myport))