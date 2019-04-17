**Exercise 1.7.**  The `good-enough?` test used in computing square roots will not be very effective for finding the square roots of very small numbers. Also, in real computers, arithmetic operations are almost always performed with limited precision. This makes our test inadequate for very large numbers. Explain these statements, with examples showing how the test fails for small and large numbers. An alternative strategy for implementing `good-enough?` is to watch how `guess` changes from one iteration to the next and to stop when the change is a very small fraction of the guess. Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers? 

**Solution:**

In my code file, I call the sqrt function on the sequence of numbers

```
1, 1e-2, 1e-4, 1e-6, 1e+10, 1e+11, 1e+12, 1e+13
```

I can visually see that as the numbers get smaller, the accuracy isn't there. In fact, `(sqrt 1e-6)` yielded the value `0.031260655525445276` which isn't very close to `.001` at all.

On the other hand when the numbers got large, it became uncertain as to whether the procedure would indeed finish. (it got stuck on `(sqrt 1e+13)` but successfully completed `(sqrt 1e+30)`.

The `new-sqrt` procedure in the code file is my implementation of the alternate strategy described above. Every test that failed the old procedure now succeeds in the new one.
