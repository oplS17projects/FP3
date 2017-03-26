#lang racket/gui
;; A GUI guessing game

(define main (new frame%
                  [label "FP3"]
                  [width 400]
                  [height 300])) ; toplevel window
(define text (new message% [parent main]
               [label "This is for testing racket/gui"]))

;;; Menu
(define menu-bar (new menu-bar%
                      (parent main)))
;;; Menu - File
(define file-menu (new menu%
                       (label "&File")
                       (parent menu-bar)))
;;; Menu - File - Quit
(new menu-item%
     (label "&Quit")
     (parent file-menu)
     (callback (lambda (item event)
                 (send main on-exit))))

;;; Menu - Help
(define help-menu (new menu%
                       (label "&Help")
                       (parent menu-bar)))

;;; Menu - Help - About
(new menu-item%
     (label "&About")

     (parent help-menu)
     (callback (lambda (item event)
                  (message-box "About"
                               "######## Author ########
Seokhwan Ko
Leon Kang"))))

;; Main panel
(define mainContent (new horizontal-panel% 
                      [parent main]))
; panel1
(define panel1 (new vertical-panel% 
                        [parent mainContent]))
; panel2
(define panel2 (new vertical-panel% 
                        [parent mainContent]))
; panel3
(define panel3 (new vertical-panel% 
                        [parent panel2]))
; panel4
(define panel4 (new horizontal-panel% 
                        [parent main]))

; version msg
(define vMsg (new message% 
                    [label "v1.0"]
                    [parent panel4]))

;;; set leftPanel
(define leftPanel (new group-box-panel% [parent panel1]
                       [label "Content"]
                       [min-width 300]
                       [min-height 200]))
;;; set rightPanel
(define right1Panel (new group-box-panel% [parent panel2]
                       [label "Setting"]
                       [min-width 50]
                       [min-height 50]))
;;; set rightdPanel
(define right2Panel (new group-box-panel% [parent panel3]
                       [label "Level"]
                       [min-width 50]
                       [min-height 50]))


; horizontal container
(define pane (new horizontal-pane% [parent right1Panel]))



;;; Text
(define textMsg2 (new message%
                     (parent leftPanel)
                     (label "Content panel")))

;;; Radio-box
(define mode-box (new radio-box%
                      (label "")
                      (parent right2Panel)
                      (choices (list "Hard"
                                     "Normal"
                                     "Easy"))
                      [style (list 'vertical)]))

;;; Button
(define ((make-check i) btn evt)
  (message-box "Button" "button works")
  (send right1Panel show #t))         ; success => close window

(make-object button% (format "~a" "New") pane (make-check 1))




(send main show #t) ; show the window to start the application