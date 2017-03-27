#lang racket
(require mode-lambda
         mode-lambda/static
         mode-lambda/color
         mode-lambda/backend/software)

; Makes a sprite database to work with
(define test-db (make-sprite-db))

; Adds a test sprite to the existing sprite database
(define num-of-sprites 0)
(define (new-add-sprite!/file db n file)
  (add-sprite!/file db n file)
  (set! num-of-sprites (+ 1 num-of-sprites)))

(define test-sprite 'test-sprite)
(new-add-sprite!/file test-db test-sprite "Desktop\\OPL Project\\Graphics Exploration\\dolphin.bmp")

; Compiles existing sprite database for further use
(define test-cdb (compile-sprite-db test-db))

; Creates an instance of the test sprite
(define test-sprite-data (sprite 0.0 0.0 1))

(stage-draw/dc
 test-cdb 400 240 1
 ;(list (vector (layer 0.0 0.0 #:mode7 3.0)) 0 0)
 ;(list 400 240 0)
 ;0)
 )
