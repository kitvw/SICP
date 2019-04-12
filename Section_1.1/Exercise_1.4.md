**Exercise 1.4.**  Observe that our model of evaluation allows for combinations whose operators are compound expressions. Use this observation to describe the behavior of the following procedure:

```
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
```
  
**Solution:** Observe that the following snippet of code from the procedure above performs the task of selecting an operator:
>`(if (> b 0) + -)`.

This means that if `b` is positive then the `+` operator is selected and the procedure essentially reduces to `(+ a b)`. Since `b` is positive, we have `b = |b|` so that the procedure does in fact return the value `a + |b|` as desired.

Now if `b` is negative, then the `-` operator is selected and the procedure essentially reduces to `(- a b)`. Since `b` is negative, we have `-b = |b|` so that the procedure does in fact return the value `a - b = a + (-b) = a + |b|` as desired.

Since all cases return the desired value, this procedure does exactly what its name implies.
