**Exercise 1.5.**  Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using applicative-order evaluation or normal-order evaluation. He defines the following two procedures:

```
(define (p) (p))

(define (test x y)
  (if (= x 0) 0 y))
```

Then he evaluates the expression

```
(test 0 (p))
```

What behavior will Ben observe with an interpreter that uses applicative-order evaluation? What behavior will he observe with an interpreter that uses normal-order evaluation? Explain your answer. (Assume that the evaluation rule for the special form `if` is the same whether the interpreter is using normal or applicative order: The predicate expression is evaluated first, and the result determines whether to evaluate the consequent or the alternative expression.) 

**Solution:** 
We begin by analyzing the behavior observed when using an applicative-order evaluation as described in section 1.1.5.
Evaluating the expression `(test 0 (p))` involves three subproblems: 
* Evaluating the operator to get the procedure to be applied.
* Evaluating the operand `0`.
* Evaluating the operand `(p)`.

Since our interpreter uses an applicative-order evaluation, it will evaluate the operands first, and then apply the result to the procedure obtained from evaluating the operator. The interpreter will be unable to evaluate `(p)` and thus the `test` expression will not successfully evaluate.
    
  
On the other hand, if our interpreter uses normal-order evaluation it will not evaluate the operands until it needs to. Working through the sequence of steps we first retrieve the body of `test` with the formal parameter `x` is replaced with `0` and the formal parameter `y` is replaced with `(p)`:

```
(if (= 0 0) 0 (p))
```

The predicate is now evaluated to a true value \(since `(= 0 0)` is indeed a true statement\). This determines that the consequent `0` is evaluated and the alternative expression `(p)` is not.

Thus the output of the procedure `test` is `0` in this case.
  
  
Based on the success or failure of the `test` procedure to run, we are able to determine whether our interpreter uses normal-order or applicative-order evaluation.
