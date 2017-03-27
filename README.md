## Library: JSON
My name: Sokthai Tang

My project is a dictionary that need to use Oxford API and return json-format data. JSON library is a good choice to manipulate with the
return json-format file. It has a lot of useful funtionalities to update, retrieve, edit, sav the nested json file. 
To connect the API, my partner, "Almeida, JoaoCarlos C" ,uses net/url to connect the API with the follwing code.

```racket
;connection
(require  json srfi/13 net/url)
(define app_id "app_id:da0194c3")
(define app_key "app_key:761ad80847bb97ee40842f7ecc43fade")
(define open_api "https://od-api.oxforddictionaries.com:443/api/v1/entries/en/")
(define con-url (string->url (string-append open_api w)))
(define dict-port (get-pure-port con-url (list app_id app_key)))
```

After the connection is established, the data from the port will be first convert to the json file.
the read-json procedure is taking no argument will return a proper json-format to the searchDict funtion
```racket
(define (readjson-from-input var)
  (with-input-from-string var
    (lambda () (read-json))))
```

the searchDict function taking three arguments, a hash table from the read-json, the word and the description. 
The hash-ref to call recursively to search for the word, definition, and examples for a given word. 
``` racket
 (define (searchDict hash k des)
  (cond ((list? hash)  (searchDict (car hash) k des))
        ((and (hash? hash) (not (empty? (hash-ref hash k (lambda () empty))))) (display hash k des))     
        (else        
         (cond ((hash? hash)              
                (for (((key val) (in-hash hash)))
                  (searchDict (hash-ref hash key) k des)))                  
               (else hash)))))
```


The display and show procedures will print the content of the word as follow
```racket
#lang racket
(require  json srfi/13 net/url)

(define (display hash k des)
  (cond
    
    ((list? (hash-ref hash k))
     (cond
       ((string? (car (hash-ref hash k))) (printf "~a~a\n" des (car (hash-ref hash k))))
       (else
        (show (hash-ref hash k) k des))))
    (else (printf "~a~a\n" des (hash-ref hash k (lambda () ""))))
  ))
    
(define (show lst k des)
  (cond ((null? lst) lst)
        (else
         (for (((key val) (in-hash (car lst )))) 
           (printf "~a~a\n" des val ))

         (show (cdr lst) k des)
         )))

```




![alt tag](https://github.com/Sokthai/OPL/blob/master/FP3/pic1.bmp)
![alt tag](https://github.com/Sokthai/OPL/blob/master/FP3/pic2.bmp)





