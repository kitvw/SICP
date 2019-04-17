**Exercise 1.3.**  Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers. 

**Solution:**
```
(define (large-sum-squares a b c)
  (cond ((and (< a b) (< a c)) (+ (* b b) (* c c)))
        ((and (< b a) (< b c)) (+ (* a a) (* c c)))
        ((and (< c a) (< c b)) (+ (* a a) (* b b)))))
; Testing the procedure
(large-sum-squares 1 2 3)
(large-sum-squares 2 1 3)
(large-sum-squares 3 2 1)
```
