
## net/url racket/gui
My name: Joao Carlos Almeida

For our project we will be creating a dictionary interface, that will allow the user to find the definition of a word and we will save the user’s search history so that the user will be able to play games to practice their newly acquired vocabulary. The two libraries I explored will be used to create the first part of the project. 

First, net/url. This library allowed me to connect to the Oxford Dictionary API, and fetch the definition of the word. This was the most difficult part of the assignment because the API documentation had no instruction of how to use it using racket. I had to read the instructions for JAVA and then adapt to the net/url library by reading the library’s documentation.

Here is the piece of code that connects to API, and displays the result in the repl:

```racket

(define (search-word word)
  (define url  (string->url (string-append "https://od-api.oxforddictionaries.com:443/api/v1/entries/en/" word)))
  (define header (list app_id app_key))
  (define my-port (get-pure-port url header))
  (display-pure-port my-port))
```

Then I explored the gui library. I created a simple window that have a text field and a button. This is the skeleton of the user interface. (And getting information from the user from an interface will also be useful when creating the game.) The user can use the text field to enter the word they wish to search. When the button is pressed it fetches what the user has typed, and it passes that string to a procedure that searches and displays the word. 

Here is the code for the button:

```racket

(new button% [parent frame]
             [label "Search"]
             ; Callback procedure for a button click:
             [callback (lambda (button event)
                         (search-word (send word-field get-value)))]) 
                         
 ```
                       
 ![FP3](/FP3.png?raw=true "FP3")
 
 The output is in the format of a JSON query (the other person in the group is look into that library)
 
