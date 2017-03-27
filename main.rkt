#lang racket/gui

(require (lib "gl.ss" "sgl")
         (lib "gl-vectors.ss" "sgl")
         "gl-frame.rkt"
         graphics/graphics)

(define (resize w h)
  (glViewport 0 0 w h)
  #t
)

(define (my-gl-init)
  ;; init code to get the opengl engine ready to render our cube
  (glClearColor 0.0 0.0 0.0 0.5)
  (glClearDepth 1)
  (glEnable GL_TEXTURE_2D)
  (glEnable GL_DEPTH_TEST)
  (glDepthFunc GL_LEQUAL)
  (glHint GL_PERSPECTIVE_CORRECTION_HINT GL_NICEST)
        
  ;; default light
  (glEnable GL_LIGHT0))

(define *xrot* 0)
(define *yrot* 0)
(define *zrot* 0)

(define (draw-opengl)
  (glClear (+ GL_COLOR_BUFFER_BIT GL_DEPTH_BUFFER_BIT))
  (glLoadIdentity)

  (glTranslated 0 0 -5)
  (glRotated *xrot* 1 0 0)
  (glRotated *yrot* 0 1 0)
  (glRotated *zrot* 0 0 1)
  
  (glBegin GL_QUADS)
      (glColor3f 0 1 0)     ; Green
      (glVertex3f  1 1 -1)
      (glVertex3f -1 1 -1)
      (glVertex3f -1 1  1)
      (glVertex3f  1 1  1)
 
      ; Bottom face (y = -1)
      (glColor3f 1 0.5 0)      ; Orange
      (glVertex3f  1 -1  1)
      (glVertex3f -1 -1  1)
      (glVertex3f -1 -1 -1)
      (glVertex3f  1 -1 -1)
  
      ; Back face (z = 1)
      (glColor3f 1 0 0)     ; red
      (glVertex3f  1 -1 1)
      (glVertex3f -1 -1 1)
      (glVertex3f -1  1 1)
      (glVertex3f  1  1 1)
 
      ; Back face (z = -1)
      (glColor3f 1 1 0)     ; Yellow
      (glVertex3f  1 -1 -1)
      (glVertex3f -1 -1 -1)
      (glVertex3f -1  1 -1)
      (glVertex3f  1  1 -1)
 
      ; Left face (x = -1)
      (glColor3f 0 0 1)     ; Blue
      (glVertex3f -1  1  1)
      (glVertex3f -1  1 -1)
      (glVertex3f -1 -1 -1)
      (glVertex3f -1 -1  1)
 
      ; Right face (x = 1)
      (glColor3f 1 0 1)     ;  Magenta
      (glVertex3f 1  1 -1)
      (glVertex3f 1  1  1)
      (glVertex3f 1 -1  1)
      (glVertex3f 1 -1 -1)
  (glEnd)
)

(add-key-mapping #\w (lambda () (set! *xrot* (+ *xrot* 5))))
(add-key-mapping #\s (lambda () (set! *xrot* (- *xrot* 5))))
(add-key-mapping #\a (lambda () (set! *yrot* (+ *yrot* 5))))
(add-key-mapping #\d (lambda () (set! *yrot* (- *yrot* 5))))

(set-gl-init-fn my-gl-init)
;; Set the draw function
(set-gl-draw-fn draw-opengl)
(gl-run)