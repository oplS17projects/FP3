
## My Library: The Racket Graphical Interface Toolkit
My name: Vibhuti Patel

My partner Prachi patel and I have decided to make an application on world clock. Basically, in this application we are giving
functionality to user to check time and date for varies timezones around the world. For this application, we are definitely using
racket/gui and racket/tzinfo libraries. So, I did my research and explor more thing from racket/gui library documantation on website. 

First, I made rough design of user interface for our project. Then I started looking at functions' description and example code for those
functions. After that, I wrote some sample codes in racket and played with it. Then I tried to code actual design that we are thinking for
project.  

I read documentation on almost every points which are refer in the Racket Graphical Interface Toolkit document like: Windowin, Widget
Gallery, Windowing Classes, Windowing Functions, Editors, Editor Classes, Editor Functions, Preferences, Dynamic Loading, Startup Actions,
Init Libraries, Platform Dependencies

# Creating Windows
The following example program creates a frame with a text message and tabs on main window frame.
```racket
; Make a frame by instantiating the frame% class
(define main-frame (new frame% [label "World Clock"]
                               [width 300]
                               [height 400]))


; Make a static text message in the frame
(define msg-current-time (new message% [parent main-frame]
                          [label "Hello, World!
                You can check current time for all TIME ZONES"]))

;tab on windows
(define tab-panel (new tab-panel%
                       (parent main-frame)
                       (choices (list "CURRENT-TIME-CHECK"
                                      "TIME-CONVERTOR"))
                       (callback
                               (lambda (tp event)
                                (case (send tp get-selection)
                                 ((0) (send tp change-children (lambda (children) (list time-check-panel))))
                                 ((1) (send tp change-children (lambda (children) (list time-convertor-panel))))
                                 )))))

; current-time-check tab stuff
(define time-check-panel (new panel% (parent tab-panel)))

(define time-check-panel-top (new vertical-panel% (parent time-check-panel)))
(define time-check-text (new message% (parent time-check-panel-top) (label "ETC current Time & Date:")))

(define timezone-name (string-append "US/" "New York"))
(define selected-timezone-time-check-text (new message% (parent time-check-panel-top) (label timezone-name)))


; time - covertor tab stuff
(define time-convertor-panel (new panel% (parent tab-panel)))

(define time-convertor-panel-top (new vertical-panel% (parent time-convertor-panel)))
(define time-convertor-text (new message% (parent time-convertor-panel-top) (label "TIME & DATE CONVERTOR:")))
; Make a button in the frame
(define time-convertor-bt-text (new message% [parent time-convertor-panel-top] [label "hi world"]))
(define time-convertor-button (new button% [parent time-convertor-panel-top]
             [label "OK"]
             ; Callback procedure for a button click:
             [callback (lambda (button event)
                   (send time-convertor-bt-text set-label ""))]))

; Show the frame by calling its show method
; before opening window, we keep primary tab open
(send tab-panel change-children (lambda (children) (list time-check-panel)))
(send main-frame show #t)
```
The frame% class creates frame with given label and given dimentions. The message% class writes massage with given label value under given
parent window. A tab panel arranges its subwindows in a single column, but also includes a horizontal row of tabs at the top of the panel.
The tab-panel% class does not implement the virtual swapping of the panel content when a new tab is selected. That's why I have used case 
procedure when 'tab-panel event is happened. According to tab, child panel would be changed. The output of this code and when "CURRENT
TIME CHECK" tab is selected, is given below.

![ouput image](/world-clock-current-time-tab.png?raw=true "ouput image")

when "TIME CONVERTOR" tab is selected that output is given below. In this tab panel, I created "OK" button using button% class and have
given callback value. 

![output-tab2 image](/world-clock-time-convertor-tab.png?raw=true "output-tab2 image")

With this exercise, I have explored some really helpful functions which we need for our project.

<!-- Links -->
[FP1]: https://github.com/oplS17projects/FP1
[schedule]: https://github.com/oplS17projects/FP-Schedule
[markdown]: https://help.github.com/articles/markdown-basics/
[forking]: https://guides.github.com/activities/forking/
[ref-clone]: http://gitref.org/creating/#clone
[ref-commit]: http://gitref.org/basic/#commit
[ref-push]: http://gitref.org/remotes/#push
[pull-request]: https://help.github.com/articles/creating-a-pull-request
