#lang racket

(provide rect)

(struct rect
  ([x #:mutable]
   [y #:mutable]
   [width #:mutable]
   [height #:mutable]))
