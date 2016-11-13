#lang racket/gui

(require sgl/gl)

(provide gl-canvas%
		 gl-view%)

(define gl-canvas%
  (class canvas%
	(inherit with-gl-context swap-gl-buffers)
	(define/override (on-paint)
	  (with-gl-context
	   (lambda ()
		 (glClearColor 0.0 0.0 0.0 1.0)
		 (glFlush)
		 (swap-gl-buffers))))  
	(super-new)))

(define gl-view%
  (class object%
	(init view-caption width height)
	(field (frame (new frame% [label view-caption] [width width] [height height])))
	(field (canvas (new gl-canvas% [parent frame] [style '(gl)])))
	(send frame show #t)
	(super-new)))

