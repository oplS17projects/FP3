# FP3: Final Project Assignment 3: Exploration 2

My name: **Patrick Kyoyetera**

## data/ring-buffer

I chose to use data/ring-buffer because it might be the best way to hold team/personal data and easily manipulate it. 
I played aruond witht the functions in the library, creating ring-buffers, pushing, swapping and printing data. 
The library does not have manby procedures except those that manipulate the user-created ring buffer itself.

Creating anew buffer:

```
(define rbuf (empty-ring-buffer 4))
```

Adding items to the buffer:

```
(ring-buffer-push! rbuf 23)
(ring-buffer-push! rbuf 1)
(ring-buffer-push! rbuf 16)
(ring-buffer-push! rbuf 42)
```

Also, setting an element in a position in a non-empty buffer

```
(ring-buffer-set! rbuf1 1 200) ;; Should put 200 where the 82 is
```

![test image](/buffer_img.png?raw=true "test image")

