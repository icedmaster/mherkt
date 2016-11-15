#lang racket

(require "mhe/view.rkt")
(require "mhe/pipeline.rkt")
(require "mhe/rect.rkt")
(require "mhe/device.rkt")
(require "mhe/context.rkt")
(require "mhe/shaders.rkt")
(require "mhe/opengl/main.rkt")

(define p (pipeline
           (input-state #t)
           (input-assembly 'gl-triangles)
           (rasterization-state 'gl-cull-none)
           (depth-stencil-state #t #t 'gl-less-equal)
           (blend-state #f)
           (viewport-state (rect 0 0 800 600))
           '()))

(define context (new context% [appname "mherkt-test"] [width 800] [height 600]))
(let ([device (get-field device context)])
  (send (get-field view context) with-gl-context (lambda ()
                                                   (define s (load-shader (list (list "test-vs.glsl" GL_VERTEX_SHADER) (list "test-fs.glsl" GL_FRAGMENT_SHADER))))
                                                   (send device set-pipeline p))))




