# FP3: Final Project Assignment 3: Exploration 2
Due Sunday, March 26, 2017

## My Library: picturing-programs
My name: Chuong Vu

Honestly, this project we did not really relied much on the racket library because so far we have done by our own method to get the solution. We may or may not use another racket library but this is how far that we get.

For this project, I have use most with the picture-programs library.

```racket
;; read the image to bimap, use 
(define imgtest (bitmap "test.png"))

;; get image height
(define img-height (image-height imgtest))

;; get image width
(define img-width (image-width imgtest))
```
This bitmap image will use to read the pixel according to coordinate x/y by using command `(get-pixel-color y x imgtest)`. The problem here is the `get-pixel-color` will create an immutable struct so we found another way is convert this color-pixel to a string and get three value R/G/B that changeable to use it to calculate the pixels (And Duy have done that by using `string` library from racket). 

The simple gray list that I have calculate is really basic method that add all R/G/B value and divided by 3 to get the gray values.
```racket
;;Create a gray list
;; This will be the based for any other method. The gray-point will be the final list before convert image
(define (gray-point lst)
  (local
    [(define gray (quotient (+ (list-ref lst 0) (list-ref lst 1) (list-ref lst 2)) 3))]
    (make-color gray gray gray)))

(define (GrayList-iter width height)
  (for/list ([x (in-range 0 height)])
    (for/list ([y (in-range 0 width)])
      (gray-point (list-ref (list-ref RGBList x) y))
      )))

(define GrayList
  (GrayList-iter img-width img-height))
```

After I get the gray values, the only thing I need is convert it back to image by using the function called `color-list->bitmap` from the library. 

```racket
;; from pixel to bitmap
;; the form of color is the struct so it need to be a list of color struct so it can convert to bitmap
(define save-photo
  (save-image (color-list->bitmap FinalGrayList img-width img-height) "Sample-output.png"))
```

The problem of this function is it only take a list of color objects (ex: #(struct:color 70 70 70 255)) and you can take a good look at the grayout.txt for the format of the color-list before it can create a image.

There are fews methods to convert all elemnt into single list but we just use `(append* list)` that already built-in in racket to convert graylist to finalgraylist

```racket
(define FinalGrayList
  (append* GrayList)
```

## Picture Output
![alt text][output]


## Problems
Although we already got to the gray pictures (black-white) but not we are facing the trouble finding the method to convert image to cartoon-ify, we have do some google search and asking around to find the method but still have no solution. We may try to go to the library and hope we can find a book talk about this.


<!-- Links -->
[FP1]: https://github.com/oplS17projects/FP1
[schedule]: https://github.com/oplS17projects/FP-Schedule
[markdown]: https://help.github.com/articles/markdown-basics/
[forking]: https://guides.github.com/activities/forking/
[ref-clone]: http://gitref.org/creating/#clone
[ref-commit]: http://gitref.org/basic/#commit
[ref-push]: http://gitref.org/remotes/#push
[pull-request]: https://help.github.com/articles/creating-a-pull-request
[output]: https://github.com/vdc1703/FP3/blob/master/OutPut.PNG
