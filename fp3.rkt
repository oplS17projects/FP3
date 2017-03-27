;; http://docs.racket-lang.org/more/
;; This tutorial is dense but provides some usable code/concepts for 

;; http://docs.racket-lang.org/more/step2.txt

#lang racket
(require racket/tcp)
;; The `serve' function is revised to run the loop
;; in a thread, and it returns a function to shut down
;; down the server.

(define (serve port-no)
  ;;  "The server accepts TCP connections through a listener, which we create with tcp-listen.
  ;;  To make interactive development easier, we supply #t as the third argument to tcp-listen,
  ;;  which lets us re-use the port number immediately, without waiting for a TCP timeout. " - /more/ tutorial
  ;; -- but what is that 5 for?
  ;; link to tcp-listen documentation
  ;; http://docs.racket-lang.org/reference/tcp.html#%28def._%28%28lib._racket%2Ftcp..rkt%29._tcp-listen%29%29
  (define listener (tcp-listen port-no 5 #t))
  (define (loop)
    (accept-and-handle listener)
      (loop))
  (define t (thread loop))
  (lambda ()
    (kill-thread t)
    (tcp-close listener)))

;; accept-and-handle accepts a connection using tcp-accept
;; tcp-acccpt returns "a stream for input from the client, and a stream for output to the client."

(define (accept-and-handle listener)
  (define-values (in out) (tcp-accept listener))
  (handle in out)
  (close-input-port in)
  (close-output-port out))

(define (handle in out)
  ;; Discard the request header (up to blank line):
  (regexp-match #rx"(\r\n|^)\r\n" in)
  ;; Send reply:
  (display "HTTP/1.0 200 Okay\r\n" out)
  (display "Server: k\r\nContent-Type: text/html\r\n\r\n" out)
  (display "<html><body>FP test server</body></html>" out))

;> (define stop (serve 8081))
;> (stop)
;> (define stop (serve 8081))
;> (stop)
;

;; Creating connections to and from ports
;; http://stackoverflow.com/questions/21598836/how-to-use-tcp-in-racket
;; http://stackoverflow.com/questions/41727972/why-doesnt-my-network-server-on-racket-receive-data-more-than-once

;; Create a server that accepts input, displays it, then closes.

;#lang racket
;(require racket/tcp)
;(define the-listener (tcp-listen 8099))
;
;(define-values (in out) (tcp-accept the-listener))
;(displayln (read in))
;(tcp-close the-listener)
;

;; connecting to our server using tcp-connect then writing to the ouput stream it returns

;#lang racket
;(require racket/tcp)
;(define-values (in out) (tcp-connect "127.0.0.1" 8099))
;(write "test string" out)
;(flush-output out)
;

;; so we can use define-values to catch the two streams returned by tcp-connect

;> (define-values (in1 out2) (tcp-connect "8.8.8.8." 53))
;> in1
;#<input-port:8.8.8.8.>
;> out2
;#<output-port:8.8.8.8.>
;> (read in1)
;#<eof>
;> (define-values (in3 out4) (tcp-connect "8.8.8.8." 533))
;; this throws an error
;tcp-connect: connection failed
;  address: 8.8.8.8.
;  port number: 533
;  step: 6
;  system error: Operation timed out; errno=60



;; Information about catching exceptions
;; We need to be prepared to catch the
;; tcp-connect: connection failed
;; error and in that case we can just execute a lamba with an empty body
;; since we will not be adding the attempted PORT to our list of OPEN_T_PORTS

;; The specific error we want to catch
;; https://docs.racket-lang.org/reference/exns.html#%28def._%28%28lib._racket%2Fprivate%2Fbase..rkt%29._exn~3afail~3anetwork%29%29

;; General Racket Exceptions guide
;; https://docs.racket-lang.org/guide/exns.html

;> (error "crash!")
;crash!
;> (with-handlers ([exn:fail? (lambda (exn) 'air-bag)])
;    (error "crash!"))
;'air-bag

;; try catching [ exn::<...> (lambda (exn) ) ]