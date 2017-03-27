## net/url
## csv-reading
My name: Sim Dy

For this exploration, I wanted to practice pulling stock market data in the form of CSV, manipulating the data and storing it using the library I explored from FP1: simple-xlsx library.

The current project concept is to make a service which will pull stock market performance for a publicly traded company, produce a variety of different visualizations, and provide a rough estimate of future stock perforamnce if you recieved stock compensation. 

I am using FP3 to tackle the first part of the project (pulling historical stock data) and also finding different sources for stock performances. 

## Historical Stock Quotes Data Sources
1. [Financial Content](https://markets.chron.com/chron/?Page=HISTORICAL&Ticker=GOOG)
2. [Yahoo](https://finance.yahoo.com/q/hp?s=GOOG)
3. [Google](https://www.google.com/finance/historical?q=GOOG)
4. [Investopedia](https://simulator.investopedia.com/stocks/goog/historical)
5. [Quotemedia](https://www.dukascopy.com/swiss/english/data_feed/csv_data_export/)
6. [Dukascopy](https://www.dukascopy.com/swiss/english/data_feed/csv_data_export/)
7. [Kumo swep](https://kumo.swcp.com/stocks/)
8. [AOL](https://finance.aol.com/quotes/google-inc/goog/nas/historical-prices)
9. [MSN](https://moneycentral.msn.com/investor/charts/chartdl.aspx?Symbol=GOOG)
10. [FinData](https://www.findata.co.nz/Markets/StockQuote/NASDAQ/goog.htm)

The libraries used are:

'''racket
  (require net/url)
  (require csv-reading)
  (require simple-xlsx)
'''

net/url is used to pull CSV files from internet sources.

'''racket

;; Procedure call to pull CSV file from a user provided URL.
;; Extracts the file and puts the data into a list of lists

  ((compose csv->list get-pure-port string->url)
  "https://ichart.finance.yahoo.com/table.csv?d=6&e=1&f=2016&g=d&a=7&b=19&c=2004&ignore=.csv&s=GOOG")
  
'''

This procedure results in this:

![net-url example]

*Note that each element within the list of lists is a string. We would need to convert this into integers before copying it over to XLSX using the simple-xlsx library.

csv-reading is used to read the CSV files and produce a list of lists of strings of the stock data.

'''racket

  ;; Construct a CSV reader on the input
  ;; Allows for traversal row by row of the csv file
  ;; using (next-row) proc

  (define next-row
    (make-csv-reader
     (open-input-file "goog.csv")
     '((separator-chars            #\, )
       (strip-leading-whitespace?  .1 #t)
       (strip-trailing-whitespace? .1 #t))))
'''

Example:
![net-url example]

'''racket

  ;; Allows list creation of csv file directly without having to pull from URL

  (csv->list (open-input-file "goog.csv"))
'''

Example:
![csv-list example]

simple-xlsx is used to write the CSV data into a workable Excel format to be manipulated into different charts and graphics.

'''racket
  ;; Uses simple-xlsx write function to write the value from CSV format to XLSX format.
  ;; the cells #:sheet_data will be in the format of whatever the list is containing, i.e. if it is just from
  ;; a CSV file, then the cells will be formatted in strings

  (let ([xlsx (new xlsx%)])
    (send xlsx add-data-sheet
         #:sheet_name "DataSheet"
         #:sheet_data SM) ;; SM is the list being written into XLSX format

   (write-xlsx-file xlsx "test.xlsx"))
'''

Result:
![xlsx-example]

Note that each "number" value in the cells are not actual formatted numbers. This has to do with how the data is being passed from CSV list to the xlsx file. 

Currently, I've written a function to convert the necessary data elements from string to number using:
'''racket
  (define l '())
  (for ([i SM_tail])

    (define dates (car i))
    (define SM_tail_num (append l (map string->number (cdr i))))

    (define combined (cons dates SM_tail_num))
    (define temp (append l combined))
    (displayln temp)
    )
'''

This function produces a list where the first element is a string corresponding to the date while the rest of the elements are integers corresponding to the opening value, highest value, lowest value, closing value, and volume traded.

'''racket
    (24-Mar-17 820.08 821.93 808.89 814.43 1981006)
    (23-Mar-17 821.0 822.57 812.26 817.58 3487056)
    (22-Mar-17 831.91 835.55 827.18 829.59 1401465)
    (21-Mar-17 851.4 853.5 829.02 830.46 2463484)
    (20-Mar-17 850.01 850.22 845.15 848.4 1231521)
    (17-Mar-17 851.61 853.4 847.11 852.12 1716471)
    (16-Mar-17 849.03 850.85 846.13 848.78 977560)
    (15-Mar-17 847.59 848.63 840.77 847.2 1381474)
    (14-Mar-17 843.64 847.24 840.8 845.62 780198)
    (13-Mar-17 844.0 848.68 843.25 845.54 1223647)
    (10-Mar-17 843.28 844.91 839.5 843.25 1704024)
    (9-Mar-17 836.0 842.0 834.21 838.68 1261517)
    (8-Mar-17 833.51 838.15 831.79 835.37 989773)
    (7-Mar-17 827.4 833.41 826.52 831.91 1037630)
    (6-Mar-17 826.95 828.88 822.4 827.78 1109037)
    (3-Mar-17 830.56 831.36 825.75 829.08 896378)
    (2-Mar-17 833.85 834.51 829.64 830.63 942476)
    (1-Mar-17 828.85 836.26 827.26 835.24 1496540)
    (28-Feb-17 825.61 828.54 820.2 823.21 2260769)
    (27-Feb-17 824.55 830.5 824.0 829.28 1101466)
    (24-Feb-17 827.73 829.0 824.2 828.64 1392202)
    (23-Feb-17 830.12 832.46 822.88 831.33 1472771)
    (22-Feb-17 828.66 833.25 828.64 830.76 987248)
    (21-Feb-17 828.66 833.45 828.35 831.66 1262337)
    (17-Feb-17 823.02 828.07 821.66 828.07 1611039)
    (16-Feb-17 819.93 824.4 818.98 824.16 1287626)
'''

However, I am unable to copy the list which has the correct data formats into the xlsx file because the loop is scoped in the for loop. It should definitely be doable because there is a procedure (set!) which assigns a new value to an existing variable. I've tried setting temp to l, which is scoped outside of the for loop. The current thinking right now is to use a series of accumulate with lambdas OR a set of nested for loops to work around this problem.

# Next Steps

1. The next steps for the project would be to solve the problem of passing in data formatted as strings into an xlsx file. This is crucial because otherwise we can't manipulate the data into graphs and charts, the core concept of the project.
2. Develop interface for users to select the company, stock performance range, and what type of visualization they want. 
3. Decide how to store the data and from what source. A set of data for popular companies could be stored locally while any obscure or lesser known companies can be pulled directly from the internet using net/url library
4. Use other libraries like plot to show different visuals from those available in simple-xlsx library
5. Develop support for multi-company comparisions of stock performance 
