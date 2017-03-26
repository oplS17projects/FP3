#lang racket
(require racket/tcp)

(define ports (let-values ([(input output) (tcp-connect "cs.uml.edu" 22)])
                (list input output)))

(define in (car ports))
(define out (cadr ports))

(list in out)
(tcp-port? in)
(input-port? in)
(tcp-port? out)
(output-port? out)
(close-input-port in)
(close-output-port out)