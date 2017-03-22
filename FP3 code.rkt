#lang racket
;;Allows us to access the different keywords / items in the library such as bitmap
> (require pict images/icons/control images/icons/style)
;;The type of picture we are going to make is a bitmap
> (pict->bitmap
   ;;We are putting a picture object inside of another picture object
   (cc-superimpose
    ;;This code controls the circle on the outside of the arrow for the first icon!
    (bitmap (record-icon #:color "blue" #:height 100
                         ;;As you can see you can control the color, height (size) , and material of the icon
                         #:material glass-icon-material))
    ;;This next set of code is for the arrow contained inside of the previous icon object.
    (bitmap (step-icon #:color light-metal-icon-color #:height 48
                       #:material metal-icon-material))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Below are a few custom Icons I wanted to play around with to extend further then the demo provided
;;Icon #2 with height altered
(step-icon #:color syntax-icon-color #:height 22)
;;Icon #3 with height and material altered
(stop-icon #:color halt-icon-color #:height 32 #:material rubber-icon-material)
;;Icon #4 with height and material altered
(play-icon #:color run-icon-color #:height 42 #:material plastic-icon-material)
;;Icon #5 (#2 altered) with height and Color altered
(stop-icon #:color "forestgreen" #:height 62 #:material rubber-icon-material)
(require images/icons/symbol)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Another custom icon but with words!
(text-icon "Derek Ross!"
             #:color "lightskyblue" #:height 44)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Relevant real world icon example
(require images/icons/file)
(save-icon #:height 32)



