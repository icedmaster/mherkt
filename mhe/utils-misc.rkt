#lang racket

(provide println)

(define (println . args)
  (printf (first args) (second args))
  (newline)
  (flush-output))

