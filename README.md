## racket/tcp
My name: Chris Guyott

I used the racket/tcp library to connect to the uml cs server. I also used some related predicates to check the input and output ports and printed the port objects in a list.

```racket
(define ports (let-values ([(input output) (tcp-connect "cs.uml.edu" 22)])
                (list input output)))
```
This code segment creates a list of two objects called ports. The first object is the input port and the second is the output port used to interface with the cs server.

![output](/pic.png?raw=true "output")
