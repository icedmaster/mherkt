#lang racket

(provide println)

(define (println . args)
  (printf (car args) (cdr args))
  (newline)
  (flush-output))

