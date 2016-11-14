#lang racket

(require sgl)

(provide (all-defined-out))

(struct input-state
  ([layout #:mutable]))

(struct input-assembly
  ([topology #:mutable]))

(struct rasterization-state
  ([cull-mode #:mutable]))

(struct depth-stencil-state
  ([depth-test-enabled #:mutable]
   [depth-write-enabled #:mutable]
   [depth-comparison-op #:mutable]))

(struct blend-state
  ([blend-enabled #:mutable]))

(struct viewport-state
  ([rect #:mutable]))

(struct shader-stage
  ([shader #:mutable]
   [stage #:mutable]))

(struct pipeline
  ([input-state #:mutable]
   [input-assembly #:mutable]
   [rasterization-state #:mutable]
   [depth-stencil-state #:mutable]
   [blend-state #:mutable]
   [viewport-state #:mutable]
   [shader-stages #:mutable]))
