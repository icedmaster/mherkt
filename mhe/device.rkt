#lang racket

(require sgl/gl
         "pipeline.rkt"
         "utils-misc.rkt"
         "rect.rkt")

(provide device%)

(define device%
  (class object%
    ;; initialization
    (println "~a" (glGetString GL_RENDERER))
    (println "~a" (glGetString GL_VENDOR))
    (println "~a" (glGetString GL_VERSION))
    (define/public (set-pipeline pipeline)
      (set-input-state pipeline)
      (set-input-assembly pipeline)
      (set-rasterization-state pipeline)
      (set-depth-stencil-state pipeline)
      (set-blend-state pipeline)
      (set-viewport-state pipeline))

    (define current-topology #f)

    (define/private (set-input-state pipeline)
      (let ([is (pipeline-input-state pipeline)])
        #f))

    (define/private (set-input-assembly pipeline)
      (let ([ia (pipeline-input-assembly pipeline)])
        (set! current-topology (input-assembly-topology ia))))    

    (define/private (set-rasterization-state pipeline)
      (let ([rs (pipeline-rasterization-state pipeline)])
        (if (rasterization-state-culling-enabled rs)
            (glEnable GL_CULL_FACE)
            (glDisable GL_CULL_FACE))))

    (define/private (set-depth-stencil-state pipeline)
      (let ([dss (pipeline-depth-stencil-state pipeline)])
        (if (depth-stencil-state-depth-test-enabled dss)
            (glEnable GL_DEPTH_TEST)
            (glDisable GL_DEPTH_TEST))
        (if (depth-stencil-state-depth-write-enabled dss)
            (glDepthMask GL_TRUE)
            (glDepthMask GL_FALSE))))

    (define/private (set-blend-state pipeline)
      (let ([bs (pipeline-blend-state pipeline)])
        (if (blend-state-blend-enabled bs)
            (glEnable GL_BLEND)
            (glDisable GL_BLEND))))

    (define/private (set-viewport-state pipeline)
      (let ([vs (pipeline-viewport-state pipeline)])
        (let ([r (viewport-state-rect vs)])
          (glViewport 0 0 0 0))))

    (super-new)))
