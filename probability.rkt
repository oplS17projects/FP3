#lang racket


(require sql db)
(require math/statistics)

(require math/distributions)

;;the math/statistics library provides functionality for statistcal information
;; liek means, variance, skewdness, for sets of data

;; Our project will deal with storing information in a database, and providing statistical analysis on this data

;; computes E[x] for X, the only paramater, a list of outcomes in set
(display "\nMean and std deviation for list (1 2 3 4 5)\n")
(mean '(1 2 3 4 5))

;;std deviation for set of data

(stddev '(1 2 3 4 5))

;;`statistics object can have sets of data added, and keeps track of statistical information through objects functions

(define s empty-statistics)

;;updates the statistics passed as first param with second paramter value
;; this value is weighted by third pasram if given (below zero would assume a probability measure)

(define s1 (update-statistics s 1 ))
(define s2 (update-statistics s1 2))
(define s3 (update-statistics s2 3))

(display "\n The Mean for statistics object with  ( 1 2 3) as updated possible outcomes\n")

(statistics-mean s3)

;;Returns a hash table mapping each unique element in xs (under equal?) to its count, or, if ws is not #f, to its total weight.
;;organized and ordered for convenience

(display "\nIdentical Hash tables for two different constructors.\n")


(define ht (samples->hash '(1 1 1 2 3 3 4 5 5)))

ht

;;can also weight each value in first param list with correlating indexed values in second list

(define ht2 (samples->hash '(1 1 2 3 4) '(1/2 1/2 1 1 2)))

ht2

;;Like hash-table, but returns data as two lists, the values and weights in correlating indexes

(display "\nIdentical to the first provided hash table, the first list are outcomes, and the second is their weight\n")

(count-samples '(1 1 1 2 3 3 4 5 5))

;;sorts second param passed samples by conditional ordering passed as first param


(display "\nThe result of sort-samples on a set with value 1->5 in any order\n")

(sort-samples < '(5 2 3 1))


;;;; Probabilty

;;returns the probability of obtaining the second param (quoted),
;; given the distribution and that its symbol is in the distribution

(pdf (discrete-dist '(h i j) '(1 2 3)) 'a)

;; example of defining a bernoulli distribution for n trials with p probabilty 0.75
;; n = param1 p = param2

(define d (binomial-dist 2 0.75))

;; given the distribution paramters
;; returns the probability for each number of succeses
;; given as number in the second param list
;; note the probabilty of 3 succes for 2 trial is always zero

(map (distribution-pdf d) '(0 1 2 3))


;; represents a geometric distribution with a probability of success per trial .25
;;

(define d1 (geometric-dist 0.25))

;; will provide the probability for a list (1 - 16)
;; where the list is ccomprosied of the first success index,
;; and returns the probabilty of the first success being this index
(display "\nGeometric: p(success) = .25 \n success_index = (1-16) \n probabilties = \n" )

(build-list 16 (distribution-pdf d1))



