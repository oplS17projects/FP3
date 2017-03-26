## RackUnit
My name: Jake Adamson

When I was think about what I could make using racket unit test that was interesting. I realized that you could use closure to keep the the data shielded from any outside side affects. In this example I use a let to make the list to only live where the tests are being done.
Another interesting thing is that you can embedded checks in to functions I use this to look inside list to see if the list consists of positive even numbers.
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
Also another interesting feature of racket unit test is that they short circuit. As you can see from the output that it does not evaluate any cases passed (check = 0 10);
```racket
(test-case
 "Short circuit"
 (check = 3 3)
 (check = 0 10)
 (check = 4 4) ;; does not check
 (check = 200 45));; does not check this when test run this wont fail b/c it short circiut
```
Output:
![alt text] [output]

How this lib will help with our project is that it will be used to check that the object and all its helper helper function are working properly. Here a test that will test our project I wrote it before I started writing the objects function all I have done is come up with the functions I think it will use. I wrote the test first because I read that you are supposed to do that in order not to try and make your test work. Kinda like control groups for testing medicine.
```racket
(test-begin
 "Test string gagggagaggcgagaaa"
 (let ([mm (markModel "test.txt" 1)])
   (check = (order mm) 1)
   (check-not-equal? (order mm) 5)
   (check-equal? (kgram mm) "gagggagaggcgagaaa")
   (check-not-equal? (kgram mm) "jakejakejakejake")
   (check = (freqOfStr mm "j") 0)
   (check = (freqOfStr mm "g") 9)
   (check = (freqOfStr mm "a") 7)
   (check = (freqOfStr mm "c") 1)
   (check =  (freqOfChar mm "g" "a") 5)
   (check =  (freqOfChar mm "g" "c") 1)
   (check =  (freqOfChar mm "c" "g") 1)
   ;;(check =  (freqOfChar mm "g" "g") 3)
   ;;(check =  (freqOfChar mm "a" "a") 2)
   ))
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
[output]: https://github.com/Jake-The-Human/FP3/blob/master/Screenshot%20from%202017-03-26%2011-44-54.png
