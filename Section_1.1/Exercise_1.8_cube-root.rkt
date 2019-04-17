#lang sicp
(define (cube x)
  (* x x x))
(define (abs x)
  (cond ((< x 0) (- x))
        (else x)))
(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) (* .001 guess)))
(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))
(define (cbrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (cbrt-iter (improve guess x) x)))
(define (cube-root x)
  (cbrt-iter 1.0 x))

(cube-root 1)
(cube-root 2)
(cube-root 8)