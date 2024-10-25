[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/gYiweL7m)

# Assignment 2 - Typеs and OOP concеpts

## Task 1
### Task definition
The expectations for this task were to compare **static array**, **stack array**, and **heap array** by their execution time in either C or C++. To achieve comparable results, large arrays were used and each subprogram was called many times (at least 100,000).

### Performance testing method
Each of the three array allocation methods was called many times in a loop, and the total execution time was measured using the ```clock()``` function. 

## Explanation of results
Results of 1,000,000 calls for each subprogram for an array size of 2,091,630: 

![alt text](task1/images/1m_full.png)

This was the maximum array size that could be used without getting stack overflow (further explanation below). It is obvious that heap array allocation is much more time complex compared to the other two. To get a better understanding, here is the result with the same array size and 100,000 (10 times less than previous example) calls:

![alt text](task1/images/100k_full.png)

This time, as expected, the time taken by each array dropped proportionately to the difference between number of calls. Let's do two more comparisons with 1,000,000 and 100,000 calls again but with a 2 times smaller array size of 1,045,815:

1 million calls:

![1.000.000 calls](task1/images/1m_halfsize.png)

100k calls:

![100.000 calls](task1/images/100k_halfsize.png)

**The wrap-up of results for a better visual comparison:**
| Array Size | Iterations  | Static Array (time in ms) | Stack Array (time in ms) | Heap Array (time in ms) |
|------------|-------------|---------------------------|--------------------------|--------------------------|
| 2,091,630  | 1,000,000   |      3.013                |        5.65              |       2731.04            |
| 1,045,815  | 1,000,000   |      3.053                |        5.687             |       1372.42            |
| 2,091,630  | 100,000     |      0.311                |        0.629             |       303.991            |
| 1,045,815  | 100,000     |      0.311                |        0.607             |       154.39             |


### Static Allocation

For all tests, static array showed the fastest results. It was almost two times faster than the second fastest, stack array. There is a simple reason for that difference: memory (static) for this array gets allocated at compile time. Meaning, this memory gets initialized once throughout the entire program run, and only gets reused in loop function calls. The address of the array is in executable itself and it does not change. 

Static arrays are usually used when performance is a top priority, and array size does not ever need to change during runtime. Since array size cannot be changed during runtime, there is less flexibility in using static arrays. Additionally, memory allocated is reserved during the execution of the program, and it will not be deallocated even when the array is not used anymore. 

In the tests, static array allocation time did not grow with array size, but it grew with iteration number. This means difference in array size should not affect the time required by allocation. The increase in time due to iteration (subprogram call times) is only because the array is accessed more times.


### Stack Allocation

Stack array allocation was also very fast, but slower than static array. This is because unlike static arrays, in stack, memory gets allocated at runtime. The stack is a **Last-In-First-Out (LIFO)** data type, and allocating memory for stack happens with moving the pointer. The stack also has a fixed size, but it no longer occupies memory after function exits. Stack arrays are usually used when: 

Stack array should be used when memory management is a priority and the array size is not too large, because it gets deallocated after function returns and it has size limitations. It is a good choice for temporary arrays that are used in a small part of the program.

Like in static, in the tests, static array allocation time only grew with the number of calls to the program. This is because the time to allocate memory is independent of the array size. No matter how large or small an array is (as long as it does not exceed memory limitations), only stack pointer is adjusted on each call.

**Opinions on stack overlow**

After testing, maximum array size without getting stack overflow was about 2091630. For example, for an array size of 2100000, this was the result:

![alt text](task1/images/stack_overflow.png)

Notice the times subprogram was run is only 1. Stack overflow happening depends on declared array size and not on how many times it was declared. Turns out maximum available memory for stack allocation is 8 MB on this machine. This was verified by printing the result using this line of code: 

```C++
cout << "Stack array memory usage: " << sizeof(arr) / (1024.0 * 1024.0) << "MB" << endl;
```

Printed result:

![alt text](task1/images/stack_memory.png)

### Heap Allocation

Heap allocation was the slowest in all test cases. In heap allocation, memory gets allocated dynamically during runtime. This additionally allocated memory stays allocated until it is deallocated in the code (```delete[]```). So, heap allocation is the slowest among three due to overhead in dynamic memory management 

Heap array is used when the final array size is not known at the start of the program and it can change during execution. Additionally, heap has access to larger memory, so its array size is much less limited compared to stack. Unlike stack, the allocated memory for heap arrays stay allocated after function returns if it is not manually removed, so heap array is also the more optimal choice when we need the array to be present outside the function.

Unlike static and stack array, heap array allocation time got affected by the increase in array size as well. It is probably also because of dynamic memory management, as heap searches for a large enough free block of memory for the specific allocation. From assignment 1 task 2, we learned that dynamic arrays usually allocate more memory when it is needed at start, and allocates more when the limit is reached each time, so, this should also affect the execution time.

## Final Comparison and Wrap-up

| Array Type | Allocation Speed  | Memory Limit           | Memory Management          | Use Case                               |
|------------|-------------------|------------------------|----------------------------|----------------------------------------|
| Static     | Fast              | Fixed at compile time  | Automatic                  | Fast access to fixed-size arrays       |
| Stack      | Fast              | Limited by stack size  | Automatic (LIFO)           | Temporary, fast-access memory          |
| Heap       | Slow              | Limited by system RAM  | Manual (must be freed)     | Large or dynamically sized arrays      |

To conclude, static arrays and stack arrays are fast, but better to use when the array size is not too big. Their allocation time does not get affected by array size. In contrast, heap array allocation is slower, but it allows the usage of larger and growing arrays. Its allocation time get longer as the array size grows.