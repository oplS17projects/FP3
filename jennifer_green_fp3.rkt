#lang racket
(require racket/udp)

(define socket1
  (udp-open-socket ) )

(define (bind-socket socket name port)
  (udp-bind! socket name port) )

(define my-msg
  (make-bytes 100) )

(define (connect-to-port socket name port)
  (udp-connect! socket name port) )

(define (send-msg msg)
  (udp-send socket1 msg) )

(define (get-msg)
  (udp-receive! socket1 my-msg) )