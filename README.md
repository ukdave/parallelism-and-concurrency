# Parallelism and Concurrency

## Challenge 1: parallel tasks and shared counters

Simulate making multiple requests in parallel to slow ([IO-bound](https://en.wikipedia.org/wiki/I/O_bound)) services,
with some shared resources that need to be updated atomically to avoid race conditions.

Requirements:

1. Implement a counter that returns 1 the first time it’s called, then 2, then 3, and so on. It must be thread-safe,
   maintaining a single global value which increments correctly when called from multiple threads/fibers/processes/whatever.
2. Implement another thread-safe component that maintains a sum, with a function to add a value to the current total,
   and another to read the total.
3. Implement a function/method which reads the counter value, sleeps for a random amount of time up to 1s to simulate
   a service doing work, then returns the value.
4. Call the service 1000 times, using up to 100 threads (or equivalent) at a time, each of which should read from the
   counter, and add the value received to the sum
5. Once all threads have completed (which should take approximately 10s), display the final total, which should be
   500,500 (1 + 2 + … + 1000).
6. How about calling it a million times, with 100,000 threads? The answer should be 500,000,500,000, but it shouldn’t
   take much longer to run.
