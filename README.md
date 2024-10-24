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
This time, as expected, the time taken by each array dropped proportionately to the difference between number of calls. Let's do one more comparison with 1,000,000 and 100,000 calls again but with a 2 times smaller array size of 1,045,815:
![1.000.000 calls](task1/images/1m_halfsize.png)
![100.000 calls](task1/images/100k_halfsize.png)

**The wrap-up of results for a better visual comparison:**
| Array Size | Iterations  | Static Array (time in ms) | Stack Array (time in ms) | Heap Array (time in ms) |
|------------|-------------|---------------------------|--------------------------|--------------------------|
| 2,091,630  | 1,000,000   |      3.013                |        5.65              |       2731.04            |
| 1,045,815  | 1,000,000   |      3.053                |        5.687             |       1372.42            |
| 2,091,630  | 100,000     |      0.311                |        0.629             |       303.991            |
| 1,045,815  | 100,000     |      0.311                |        0.607             |       154.39             |


### Static Allocation

### Stack Allocation

After testing, maximum array size without getting stack overflow was about 2091630. For example, for an array size of 2100000, this was the result:

![alt text](task1/images/stack_overflow.png)

Notice the times subprogram was run is only 1. Stack overflow happening depends on declared array size and not on how many times it was declared. Turns out maximum available memory for stack allocation is 8 MB on this machine. This was verified by printing the result using this line of code: 

```C++
cout << "Stack array memory usage: " << sizeof(arr) / (1024.0 * 1024.0) << "MB" << endl;
```

Printed result:
![alt text](task1/images/stack_memory.png)