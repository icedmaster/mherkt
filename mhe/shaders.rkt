#lang racket

(require ffi/vector
         "opengl/main.rkt"
         "utils-misc.rkt")

(provide shader-program%
         load-shader)

(define shader-program%
  (class object%
    (define id 0)

    (define/public (create data)
      (set! id (glCreateProgram))
      (define shaders '())
      (for ([shader+stage data])
        (let ([shader-data (first shader+stage)] [stage (second shader+stage)])
          (let ([shader-id (glCreateShader stage)])
            (glShaderSource shader-id 1 (make-vector 1 shader-data) (s32vector (string-length shader-data)))
            (glCompileShader shader-id)
            (if (not (equal? (glGetShaderiv shader-id GL_COMPILE_STATUS) GL_TRUE))
              (println "~a" (glGetShaderInfoLog shader-id 1024))
              (begin
                (glAttachShader id shader-id)
                (set! shaders (append shaders shader-id)))))))
      (glLinkProgram id)
      (when (not (equal? (glGetProgramiv id GL_LINK_STATUS) GL_TRUE))
        (println (glGetProgramInfoLog id)))
      (for-each (lambda (arg) (glDeleteShader arg)) shaders))
    
    (define/public (destroy)
      (glDeleteProgram id))

    (super-new)))

(define (load-shader filenames)
  (define l '())
  (for ([filename+stage filenames])
    (let ([filename (first filename+stage)][stage (second filename+stage)])
      (let ([s (file->string filename)])
        (set! l (cons (list s stage) l)))))
  (define s (new shader-program%))
  (send s create l)
  s)
        


