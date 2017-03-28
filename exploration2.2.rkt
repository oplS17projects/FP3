#lang racket


(require data/ring-buffer math plot)

;(variance '(1 2 3 4 4) )

;(variance '(1 2 3 4) '(1 1 1 2) #:bias #t)

;(mean '(1 5 2 4 8 5 9 8))

;(define dates (list 1 2 3 4 5 6 7 8 9 10))
;(define steph-shots (list 6 8 12 1 0 5 6 7 7 8))

;(map (λ (shot-chart) (plot
;                     (points (for [i shot-chart])))) (body))


;(plot
; (points (list steph-shots))
;      #:x-min 0 #:x-max 20
;      #:y-min 0 #:y-max 30)

;(plot (points (map vector dates steph-shots)))


;; Using a ring buffer for this to hold team stats and stuff
;; that will change constantly as it's being represented

;; creating a ring buffer

(define rbuf (empty-ring-buffer 4))

;; adding items to the ring buffer

(ring-buffer-push! rbuf 23)
(ring-buffer-push! rbuf 1)
(ring-buffer-push! rbuf 16)
(ring-buffer-push! rbuf 42)

;; traverse and print values in the buffer
(for/list ([i rbuf]) i)

;; check if a given structure is a ring buffer
(ring-buffer? rbuf) ;; returns true because rbuf is an existing ring-buffer object

(define rb (list 1 2 3 4 5))

(ring-buffer? rb) ;; returns fault bc rb is a list not a ring-buffer

(ring-buffer-ref rbuf 2) ;;returns element at the third position in the ring buffer

;; creating a ring buffer without any elements
(define rbuf1 (empty-ring-buffer 6))

;; Push elements into empty ring buffer
(ring-buffer-push! rbuf1 100)
(ring-buffer-push! rbuf1 82)

;; Print elements in the ring buffer
(for/list ([i rbuf1]) i)

;; Switching an element int he ring buffer
(ring-buffer-set! rbuf1 1 200) ;; Should put 200 where the 82 is

(for/list ([i rbuf1]) i)

;;this library only has a few functions that do the job
