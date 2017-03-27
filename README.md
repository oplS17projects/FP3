## racket/tcp
My name: **Ibrahim Mkusa **


I played around with tcp library. It allows communication via tcp ports. They
are similar to pipes. The parties may be local or remote. It doesn't matter as
long as ip-address is known. To begin, i created tcp listener  that waits for
connection requests from clients, if they are currently none, it blocks and
waits. A client tells the other party it needs to connect via tcp-connect, and
server accepts via tcp-accept. On return both functions return an a pair of
ports for input and output. Communication is then done by writing and reading
from these ports. After communication is done, its polite to release unused
resources. You can manually close the ports as i've done or used a custodian
thats oversees resources. The custodian provides good abstraction and takes
worry about which resources were open and need to be closed during session


```
(define listener (tcp-listen 8083)) ;; listener to service connection requests

;; client attempts to connect. Receives an input and output port
(define-values (client-in client-out) (tcp-connect "localhost" 8083))

;; server accepts the connection request. Also gets a pair of ports
(define-values (server-in server-out) (tcp-accept listener))
```

![ fp3run.png](/fp3run.png?raw=true " TCP Talk")
