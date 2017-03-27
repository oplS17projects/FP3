
math/statistics and math/distributions

My name: James Goguen

I spent a lot of time trying to find libraries relevant to our project idea and ultiamtely figured I would
like to have a reliable set of mathematical functions relating to averages and statistics on large sets of information
to be stored in a database. After going through a lot of the math library, I came across the statistics and distributions part. Many of the functions seemed simple, but after palying around with them I realized there was a lot
hidden from the user. Discovering the power that a few clean and friendly functions/objects could provide, I chose this library.


The statistics library provides functionality for determing the mean, varaince, and other properties of sets of data.


Here are two of the most basic functions, for determing the mean or E[X] and the standard deviation of a Random Variable.
In this example X is represented as a set of outcomes with equal weights

```
(mean '(1 2 3 4 5))

(stddev '(1 2 3 4 5))
```


Also, for performing certain fucntions like a hash-table, the library provides two means of
representing sets of weighted data. 

The hash table returns a list of value - weight pairs.

The following hash-tables are identical (equal)...

The first is a list of value which can occur more then once, thus increasing their relative wight to the other outcomes.
```
(define ht (samples->hash '(1 1 1 2 3 3 4 5 5)))
ht
```

The second is a list of possible outcome values, followed by a list of their weights in correlating indexes
```
(define ht2 (samples->hash '(1 2 3 4 5) '(3 1 2 1 2)))
ht2
```

Both return ``` '#hash((4 . 1) (3 . 2) (2 . 1) (1 . 3) (5 . 2)) ```



The count-samples function returns two lists, the first is all possible value and the second is their weights at correlating indexes. The return statements of count-samples and hash-table are conceptually equivalent.

The following count-samples represents the same set of data as the first (ht) hash-table...

```
(count-samples '(1 1 1 2 3 3 4 5 5))
```

... and will return ``` '(1 2 3 4 5) '(3 1 2 1 2```



Some of the more interesting functionality of the distribution library involve predefined objects representing certain distribution functions. These can be used to create pdf's, and these pdf's can be interacted with to get certain probability values for the likeliness of different possible outcomes.


Here is an example of creating a discrete/finite distribution of characters and their weight, passed to the pdf function.
The pdf function takes a distribution as the first argument and an "Event", or set of possible outcomes in the distribution.

```
(pdf (discrete-dist '(h i j) '(1 2 3)) 'a)

(pdf (discrete-dist '(h i j) '(1 2 3)) 'i)
```

The first returns '0.0' for 'a never occurs, and the second returns 1/3 because out of the 6 total occurences, 'i occurs twice.



Finally, the functionality for mapping specified distributions to a list of outcomes adds the last bit of power to admire in this library.

A Binomial distribution is created here, which takes as first and second arguments, the number of trials and the probability of success in one of those trials. The distribution is mapped to a list, so given the distribution paramters, the mapping returns the probability for each number of succeses given as number in the second param list.

Note the probabilty of 3 succes for 2 trial is always zero
```
(define d (binomial-dist 2 0.75))

(map (distribution-pdf d) '(0 1 2 3))
```

Returns ```'(0.0625 0.375 0.5625 0.0)```


![FP3 OUTPUT](/FP3_output.png?raw=true "FP3 OUTPUT")

