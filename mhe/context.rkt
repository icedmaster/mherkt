#lang racket

(require "view.rkt")
(require "device.rkt")

(provide context%)

(define context%
  (class object%
    (init appname width height)
    (field (view (new gl-view% [view-caption appname] [width width] [height height])))
    (field [device #f])
    (send view with-gl-context (lambda ()
                                 (set-field! device this (new device%))))
    (send view show)
    (super-new)))

