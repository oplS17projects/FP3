;;;#lang racket

#lang web-server/insta

;;; Just some basic playing around to learn how to make a webpage in Racket
;;; Following : http://docs.racket-lang.org/continue/index.html
(define (start request)
  (response/xexpr
   '(html
     (head (title "Racket Webpage"))
     (body
      (center (h1 "This page was made in Racket!"))
      (p  "Defaults to left align...")
      (p (a ((href "http://www.google.com/")) "Here") " is a link to Google!")
      (img ((height "500px") (src "http://www.directsportseshop.co.uk/Images/ExtraLarge/head_ti_s6_tennis_racket_black.jpg")))))))

;;; Continuing on, now attempting to use render-post function to act as a template
(define (render-as-itemized-list fragments)
  `(ul ,@(map render-as-item fragments)))
 
; render-as-item: xexpr -> xexpr
; Consumes an xexpr, and produces a rendering
; as a list item.
(define (render-as-item a-fragment)
  `(li ,a-fragment))