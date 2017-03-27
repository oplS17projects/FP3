#lang racket

(require net/url)
(require 2htdp/image) ;;FP3
;(require (planet williams/describe/describe)) ;; useful to figure out a type (regexp returns bytes)

(define (trending n) ;; displays YouTube's Weekly Trending Videos from #1 - #n (n = user specified)
  (define myurl (string->url "https://www.youtube.com/feed/trending"))
  (define myport (get-pure-port myurl))
  (define title-regex #px"[:alnum:]\"\\s\\stitle=\"[a-zA-Z 0-9.,<>:;~|()!@#$%^&*+=\\-\\[\\]_'/]*") ;; find a video title
  (define clean-regex #px"[:alnum:]\"\\s\\stitle=\"") ;; used to clean up the trending title
  (define locate-regex #px"class=\"item-section\">")
  (define img-regex #px"data-thumb=\"https://i.ytimg.com/[a-zA-Z0-9/.\\-_]*")
  (define clean-img #px"data-thumb=\"")
  (define views-regex #px"</li><li>[0-9,]* views")
  (define clean-views #px"</li><li>")

  (regexp-match locate-regex myport)
  (regexp-match locate-regex myport) ;; sets the starting point for regexp
  
  (define (reverse a b) ;; proc to reverse my list
    (if (null? a) b
        (reverse (cdr a) (cons (car a) b))))
  
  (define (run-loop x lst) ;; loop through video titles a desired amount of times
    (if (= x 0) (reverse lst '())
        (run-loop 
         (sub1 x)
         (cons
          (list ;;bytes->string used here to convert Byte Strings (produced by regexp) to Strings
           ;; Thumbnail Image
           (bitmap/url (bytes->string/locale (regexp-replace clean-img (car (regexp-match img-regex myport)) "")))
           ;; Video Title
           (bytes->string/locale (regexp-replace clean-regex (car (regexp-match title-regex myport)) ""))
           ;; View Count
           (bytes->string/locale (regexp-replace clean-views (car (regexp-match views-regex myport)) "")))
          lst))))
  
  (if (and (< n 25) (> n 0)) ;; youtube's "weekly trending" only displays 24 videos
      (run-loop n '())
      "can only display a maximum of 24 videos"))
