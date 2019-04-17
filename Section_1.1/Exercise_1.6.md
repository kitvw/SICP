**Exercise 1.6.**  Alyssa P. Hacker doesn't see why `if` needs to be provided as a special form. "Why can't I just define it as an ordinary procedure in terms of `cond`?" she asks. Alyssa's friend Eva Lu Ator claims this can indeed be done, and she defines a new version of `if`:

```
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))
```

Eva demonstrates the program for Alyssa:

```
(new-if (= 2 3) 0 5)
5

(new-if (= 1 1) 0 5)
0
```

Delighted, Alyssa uses `new-if` to rewrite the square-root program:

```
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))
```

What happens when Alyssa attempts to use this to compute square roots? Explain. 

**Solution:**

The solution lies in the difference between how the interpreter evaluates the operands of `if` and `new-if`.

Recall that Lisp uses applicative-order evaluation. SICP also states that:

> The general form of an if expression is  
>   
> `(if <predicate> <consequent> <alternative>)`  
>   
> To evaluate an if expression, the interpreter starts by evaluating the <predicate> part of the expression. If the `<predicate>` evaluates to a true value, the interpreter then evaluates the `<consequent>` and returns its value. Otherwise it evaluates the `<alternative>` and returns its value.To evaluate an if expression, the interpreter starts by evaluating the `<predicate>` part of the expression. If the `<predicate>` evaluates to a true value, the interpreter then evaluates the `<consequent>` and returns its value. Otherwise it evaluates the `<alternative>` and returns its value.

Therefore the `<alternative>` part of the expression never gets evaluated unless the `<predicate>` part evaluates to a false value.
  
On the other hand, since `new-if` is a procedure the applicative-order forces the operator and all the operands to be evaluated before the resulting procedure is applied to the resulting arguments. This means that the recursive call to the `else-clause` in `new-if` within the `sqrt-iter` procedure gets evaluated _before_ `new-if` can apply the `cond` statement to determine what result gets returned. This causes an infinite loop since the interpreter will never act on `good-enough?` returning a true value.
