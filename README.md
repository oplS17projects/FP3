## RackUnit
My name: Jake Adamson

When I was think about what clould make using racket unit test special. I realised that you could use closure to keep the the data unchanged from any outside side affects.
```racket
;; this will short circut if one test fails the test will end
(test-case
 "Test Example w/ closure"
 (let ([foo (filter even? (range 1 100))])
   (for-each ;; checks that each element of a list is only pos even and greater then zero
    (lambda (elt)
      (and (check-pred even? elt) (check-pred positive? elt)))
    foo)
   (check = (length foo) 49)
   (check-equal? (car foo) 2) ; foo '(2 4 6 8 ... 94 96 98)
   (check = (last foo) 98)))
```
Also another interesting feature of racket unit test is that they short circuit.
```racket
(test-case
 "Short circuit"
 (check = 3 3)
 (check = 0 10)
 (check = 4 4) ;; does not check
 (check = 200 45));; does not check this when test run this wont fail b/c it short circiut
```
Output
```racket
--------------------
Short circuit
FAILURE
name:       check
location:   fp3.rkt:19:1
params:     (#<procedure:=> 0 10)
expression: (check = 0 10)

. Check failure
--------------------
```

<!-- Links -->
[FP1]: https://github.com/oplS17projects/FP1
[schedule]: https://github.com/oplS17projects/FP-Schedule
[markdown]: https://help.github.com/articles/markdown-basics/
[forking]: https://guides.github.com/activities/forking/
[ref-clone]: http://gitref.org/creating/#clone
[ref-commit]: http://gitref.org/basic/#commit
[ref-push]: http://gitref.org/remotes/#push
[pull-request]: https://help.github.com/articles/creating-a-pull-request
