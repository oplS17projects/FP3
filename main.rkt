#lang racket


;;stock symbol lookup program
;;https://finance.yahoo.com/lookup?s=
;;http://money.cnn.com/quote/quote.html?symb=

(require net/sendurl)
(require simple-xlsx)

;;(define my-string "http://money.cnn.com/quote/quote.html?symb=")
;;(define (iter l n)
;;(print "Enter a stock symbol in quotes")
;;  (cons l (read))
;;  (iter '() 5))
;;(send-url (string-append my-string (read))) 

;Modified this example here: https://github.com/simmone/racket-simple-xlsx/blob/master/simple-xlsx/example/example.rkt


(let ([xlsx (new xlsx%)])
  (send xlsx add-data-sheet 
        #:sheet_name "PortfolioSheet" 
        #:sheet_data '(("STOCK SYMBOL" "$ValueOpen" "$ValueNow")
                       ("AAPL" 12 13)
                       ("SSH" 9 14)
                       ("CARA" 20.5 17)
                       ))
  (send xlsx set-data-sheet-col-width! #:sheet_name "PortfolioSheet" #:col_range "A-B" #:width 50)
  

  (send xlsx add-chart-sheet #:sheet_name "LineChart1" #:topic "Horizontal Data" #:x_topic "Price")
  (send xlsx set-chart-x-data! #:sheet_name "LineChart1" #:data_sheet_name "PortfolioSheet" #:data_range "B1-D1")
  (send xlsx add-chart-serial! #:sheet_name "LineChart1" #:data_sheet_name "PortfolioSheet" #:data_range "B2-D2" #:y_topic "AAPL")
  (send xlsx add-chart-serial! #:sheet_name "LineChart1" #:data_sheet_name "PortfolioSheet" #:data_range "B3-D3" #:y_topic "SSH")
  (send xlsx add-chart-serial! #:sheet_name "LineChart1" #:data_sheet_name "PortfolioSheet" #:data_range "B4-D4" #:y_topic "CARA")

 

  (write-xlsx-file xlsx "test.xlsx")

  (with-input-from-xlsx-file
   "test.xlsx"
   (lambda (xlsx)
     (printf "~a\n" (get-sheet-names xlsx))
     

     (load-sheet "PortfolioSheet" xlsx)
     (printf "~a\n" (get-sheet-dimension xlsx)) 

     (printf "~a\n" (get-cell-value "A2" xlsx)) 

     (printf "~a\n" (get-sheet-rows xlsx))))
     
  )

  (printf "~a\n" (sheet-name-rows "test.xlsx" "PortfolioSheet"))
  

  (printf "~a\n" (sheet-ref-rows "test.xlsx" 0))
  