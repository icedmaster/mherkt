#lang racket

(require sgl/gl)
(require "pipeline.rkt")
(require "utils-misc.rkt")

(provide device%)

(define device%
  (class object%
    ;; initialization
    (println "~a" (glGetString GL_RENDERER))
    (println "~a" (glGetString GL_VENDOR))
    (println "~a" (glGetString GL_VERSION))
    (define/public (set-pipeline pipeline)
      (printf "~a\n" (pipeline-input-state pipeline)))
    (super-new)))
