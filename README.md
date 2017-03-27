# FP3: Final Project Assignment 3: Exploration 2
Due Sunday, March 26, 2017

## csv-reading
My name: **Ethan Cumming**

I created a cvs file that stores data as a list seperated by commas. I organized my data by musical artist as if to replicated someone music library info as seen here:
![test](/test.png "test image")

I read in the .csv file using ```(make-csv-reader (open-input-file "test.csv")``` which converts a string of the data. After converting the string to a list:
```
((Song Author Time) (Bohemian Rhapsody Queen 5:54) (Wonderwall Remastered 4:18) (Sad Machine Porter Robinson 5:50))
```
I dedcided to created a check that would search my list for a specific song name:
```
(define (music-filter name) (if (null? (my-filter name)) (print "Not Found In Music Library") (display name)
                                ))
```
If no value in the list evalutes to true then the fuction returns an error messages, but if found returns the track name. This Library will be helpful to create an application that searches a music library for specific information.

