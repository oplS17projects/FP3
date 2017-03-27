## racket/UPL
My name: Jennifer Green

I used the UPL racket library to create a socket, bind the socket to a local port, connect to the same port, and then send and receive messages.  Our final project is going to deal with scanning for open ports using both TCP and UDP protocols, so this is something that we will need to understand.  

First, we must create a socket that we will connect to our port.
```
(define socket1
  (udp-open-socket ) )
```
Next, we'll bind our socket to a port and then connect it to the same port.  
```
(define (bind-socket socket name port)
  (udp-bind! socket name port) )

(define (connect-to-port socket name port)
  (udp-connect! socket name port) )
```
Finally, we will define a list of bytes to hold our received message, and send and receive a message from our port.
```
(define my-msg
  (make-bytes 100) )

(define (send-msg msg)
  (udp-send socket1 msg) )

(define (get-msg)
  (udp-receive! socket1 my-msg) )
```

![program in action](/program_image_fp3.png?raw=true "program image")

Our port has connected successfully, and we have successfully sent and received a message.  The function we use to receive our message, udp-receive!, prints out the number of bytes in the message, the address, and the port.  
