;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Chapter2) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define (x-part x1 x2)
  (expt (- x2 x1) 2))
(define (y-part y1 y2)
  (expt (- y2 y1) 2))
(define (distance x1 y1 x2 y2)
  (sqrt (+ (x-part x1 x2) (y-part y1 y2))))
(define (distance-from-center x y)
  (distance 0 0 x y))

(define (carea height width)
  (* height width))
(define (cvolume height width depth)
  (* (carea height width) depth))

(define (string-first s)
  (substring s  0 1))

(define (the-true-one a b)
  (and (not a) b))
(define (the-false-one a b)
  (and a (not b)))
;IMPLICATION
(define (==> a b)
  (cond
    [(the-true-one a b) #t]
    [(the-false-one a b) #f]
    [(and a b) #t]
    [(not (and a b)) #t]
    )
  )
