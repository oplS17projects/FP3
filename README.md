## racket/tcp
My name: **Ibrahim Mkusa **

Write what you did!



* a narrative of what you did
* highlights of code that you wrote, with explanation
* output from your code demonstrating what it produced
* at least one diagram or figure showing your work
```
(define listener (tcp-listen 8083)) ;; listener to service connection requests

;; client attempts to connect. Receives an input and output port
(define-values (client-in client-out) (tcp-connect "localhost" 8083))

;; server accepts the connection request. Also gets a pair of ports
(define-values (server-in server-out) (tcp-accept listener))
```

![ fp3run.png](/fp3run.png?raw=true " TCP Talk")
