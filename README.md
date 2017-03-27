## racket/tcp
My name: Josh Everett
## Narrative

   This exploration is useful in the scope of the underlying project and our expected implementation.
The goal is to create a procedure **doctorScantron** with three arguments: 
a _string_ (ipv4 address of target machine), a _list of one or two numbers_(range of ports), and _a list of one or two characters_(tcp or udp scan).

  The **doctorScantron** calls a constructor for our **_machine_** object to return a dispatch procedure,
which will allow for message passing similar to **create account** from the bank account problemset.
Ideally we will allow for constructor to take an entire subnet or range of addresses using CIDR notation (ie "192.168.0.1/24") and create a list or structure which contains **_machine_** objects.


  With a single **_machine_** we pass it a message which will map and filter across the list of open ports the **_machine_** object contains within it's closure. Common ports should be matched to their services, but there will be no version detection or dynamic service detection.
  With multiple **_machines_** we can display which ip addresses within the range have open port <??> using similar methods.


![concept drawing](/IMG_0667.jpg?raw=true "concept")


  Not much will be required from our tcp or udp libraries. We will only attempt to initiate a connection, and if we suceed we chalk it up to success. This can pose problems when dealing with firewalls that without reviewing packet captures and manual control of flags we can't avoid. We will not attempt to parse any information from the response. 

Here I connect to one of Google's public DNS server on port 53 ( port open for DNS)
```racket

> (define-values (in1 out2) (tcp-connect "8.8.8.8." 53))
> in1
#<input-port:8.8.8.8.>
> out2
#<output-port:8.8.8.8.>
> (read in1)
#<eof>
```

And here I connect to Google's public DNS server on port 533 ( closed )
```racket
> (define-values (in3 out4) (tcp-connect "8.8.8.8." 533))
ERRORtcp-connect: connection failed
  address: 8.8.8.8.
  port number: 533
  step: 6
  system error: Operation timed out; errno=60
  ```
 
  -- and am returned an error. 
 

My included code reviews resources I've begun to mine to try and figure out some of the more complex requirements:
  ## Threading and Custodians
  We will require use of threading to make our connection attempts or we have the potential to be hung up for a lot of time.
  By trying to replicate the way some home-made racket servers handle multiple connections we should be able to launch of volley of connection requests at once.

```racket
(define (serve port-no)
  (define listener (tcp-listen port-no 5 #t))
  (define (loop)
    (accept-and-handle listener)
      (loop))
  (define t (thread loop))
  (lambda ()
    (kill-thread t)
    (tcp-close listener)))
```
_http://docs.racket-lang.org/more/step2.txt_

## Exception Handling
  We need to accept the time out error thrown when we fail to connect without crashing our application.
Can we adapt this to take our Operation timed out error? Maybe by accepting the exn:<> and passing back a lambda which does nothing?
```racket
> (error "crash!")
crash!
> (with-handlers ([exn:fail? (lambda (exn) 'air-bag)])
    (error "crash!"))
'air-bag
```
_https://docs.racket-lang.org/guide/exns.html_
