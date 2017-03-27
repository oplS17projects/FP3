
## net/url racket/gui
My name: Joao Carlos Almeida

For our project we will be creating a dictionary interface, that will allow the user to find the definition of a word and we will save the user’s search history so that the user will be able to play games to practice their newly acquired vocabulary. The two libraries I explored will be used to create the first part of the project. 

First, net/url. This library allowed me to connect to the Oxford Dictionary API, and fetch the definition of the word. This was the most difficult part of the assignment because the API documentation had no instruction of how to use it using racket. I had to read the instructions for JAVA and then adapt to the net/url library by reading the library’s documentation.

Here is the piece of code that connects to API, and displays the result in the repl:

`racket

(define (search-word word)
  (define url  (string->url (string-append "https://od-api.oxforddictionaries.com:443/api/v1/entries/en/" word)))
  (define header (list app_id app_key))
  (define my-port (get-pure-port url header))
  (display-pure-port my-port))
`

Then I explored the gui library. I created a simple window that have a text field and a button. This is the skeleton of the user interface. (And getting information from the user from an interface will also be useful when creating the game.) The user can use the text field to enter the word they wish to search. When the button is pressed it fetches what the user has typed, and it passes that string to a procedure that searches and displays the word. 

Here is the code for the button:

`racket

(new button% [parent frame]
             [label "Search"]
             ; Callback procedure for a button click:
             [callback (lambda (button event)
                         (search-word (send word-field get-value)))]) 
                        `
 The output:
 
 {
    "metadata": {
        "provider": "Oxford University Press"
    },
    "results": [
        {
            "id": "ace",
            "language": "en",
            "lexicalEntries": [
                {
                    "entries": [
                        {
                            "etymologies": [
                                "Middle English (denoting the ‘one’ on dice): via Old French from Latin as ‘unity, a unit’"
                            ],
                            "grammaticalFeatures": [
                                {
                                    "text": "Singular",
                                    "type": "Number"
                                }
                            ],
                            "homographNumber": "000",
                            "senses": [
                                {
                                    "definitions": [
                                        "a playing card with a single spot on it, ranked as the highest card in its suit in most card games"
                                    ],
                                    "domains": [
                                        "Cards"
                                    ],
                                    "examples": [
                                        {
                                            "registers": [
                                                "figurative"
                                            ],
                                            "text": "life had started dealing him aces again"
                                        },
                                        {
                                            "text": "the ace of diamonds"
                                        }
                                    ],
                                    "id": "m_en_gbus0005680.006"
                                },
                                {
                                    "definitions": [
                                        "a person who excels at a particular sport or other activity"
                                    ],
                                    "domains": [
                                        "Sport"
                                    ],
                                    "examples": [
                                        {
                                            "text": "a motorcycle ace"
                                        }
                                    ],
                                    "id": "m_en_gbus0005680.010",
                                    "registers": [
                                        "informal"
                                    ],
                                    "subsenses": [
                                        {
                                            "definitions": [
                                                "a pilot who has shot down many enemy aircraft"
                                            ],
                                            "domains": [
                                                "Air Force"
                                            ],
                                            "examples": [
                                                {
                                                    "text": "a Battle of Britain ace"
                                                }
                                            ],
                                            "id": "m_en_gbus0005680.011"
                                        }
                                    ]
                                },
                                {
                                    "definitions": [
                                        "(in tennis and similar games) a service that an opponent is unable to return and thus wins a point"
                                    ],
                                    "domains": [
                                        "Tennis"
                                    ],
                                    "examples": [
                                        {
                                            "text": "Nadal banged down eight aces in the set"
                                        }
                                    ],
                                    "id": "m_en_gbus0005680.013",
                                    "subsenses": [
                                        {
                                            "definitions": [
                                                "a hole in one"
                                            ],
                                            "domains": [
                                                "Golf"
                                            ],
                                            "examples": [
                                                {
                                                    "text": "his hole in one at the 15th was Senior's second ace as a professional"
                                                }
                                            ],
                                            "id": "m_en_gbus0005680.014",
                                            "registers": [
                                                "informal"
                                            ]
                                        }
                                    ]
                                }
                            ]
                        }
                    ],
                    "language": "en",
                    "lexicalCategory": "Noun",
                    "pronunciations": [
                        {
                            "audioFile": "http://audio.oxforddictionaries.com/en/mp3/ace_gb_1.mp3",
                            "dialects": [
                                "British English"
                            ],
                            "phoneticNotation": "IPA",
                            "phoneticSpelling": "eɪs"
                        }
                    ],
                    "text": "ace"
                },
                {
                    "entries": [
                        {
                            "grammaticalFeatures": [
                                {
                                    "text": "Positive",
                                    "type": "Degree"
                                }
                            ],
                            "homographNumber": "001",
                            "senses": [
                                {
                                    "definitions": [
                                        "very good"
                                    ],
                                    "examples": [
                                        {
                                            "text": "Ace! You've done it!"
                                        },
                                        {
                                            "text": "an ace swimmer"
                                        }
                                    ],
                                    "id": "m_en_gbus0005680.016",
                                    "registers": [
                                        "informal"
                                    ]
                                }
                            ]
                        }
                    ],
                    "language": "en",
                    "lexicalCategory": "Adjective",
                    "pronunciations": [
                        {
                            "audioFile": "http://audio.oxforddictionaries.com/en/mp3/ace_gb_1.mp3",
                            "dialects": [
                                "British English"
                            ],
                            "phoneticNotation": "IPA",
                            "phoneticSpelling": "eɪs"
                        }
                    ],
                    "text": "ace"
                },
                {
                    "entries": [
                        {
                            "grammaticalFeatures": [
                                {
                                    "text": "Transitive",
                                    "type": "Subcategorization"
                                },
                                {
                                    "text": "Present",
                                    "type": "Tense"
                                }
                            ],
                            "homographNumber": "002",
                            "senses": [
                                {
                                    "definitions": [
                                        "(in tennis and similar games) serve an ace against (an opponent)"
                                    ],
                                    "domains": [
                                        "Tennis"
                                    ],
                                    "examples": [
                                        {
                                            "text": "he can ace opponents with serves of no more than 62 mph"
                                        }
                                    ],
                                    "id": "m_en_gbus0005680.020",
                                    "registers": [
                                        "informal"
                                    ],
                                    "subsenses": [
                                        {
                                            "definitions": [
                                                "score an ace on (a hole) or with (a shot)"
                                            ],
                                            "domains": [
                                                "Golf"
                                            ],
                                            "examples": [
                                                {
                                                    "text": "there was a prize for the first player to ace the hole"
                                                }
                                            ],
                                            "id": "m_en_gbus0005680.026"
                                        }
                                    ]
                                },
                                {
                                    "definitions": [
                                        "achieve high marks in (a test or exam)"
                                    ],
                                    "examples": [
                                        {
                                            "text": "I aced my grammar test"
                                        }
                                    ],
                                    "id": "m_en_gbus0005680.028",
                                    "regions": [
                                        "North American"
                                    ],
                                    "registers": [
                                        "informal"
                                    ],
                                    "subsenses": [
                                        {
                                            "definitions": [
                                                "outdo someone in a competitive situation"
                                            ],
                                            "examples": [
                                                {
                                                    "text": "the magazine won an award, acing out its rivals"
                                                }
                                            ],
                                            "id": "m_en_gbus0005680.029",
                                            "notes": [
                                                {
                                                    "text": "\"ace someone out\"",
                                                    "type": "wordFormNote"
                                                }
                                            ]
                                        }
                                    ]
                                }
                            ]
                        }
                    ],
                    "language": "en",
                    "lexicalCategory": "Verb",
                    "pronunciations": [
                        {
                            "audioFile": "http://audio.oxforddictionaries.com/en/mp3/ace_gb_1.mp3",
                            "dialects": [
                                "British English"
                            ],
                            "phoneticNotation": "IPA",
                            "phoneticSpelling": "eɪs"
                        }
                    ],
                    "text": "ace"
                }
            ],
            "type": "headword",
            "word": "ace"
        }
    ]
}> 
                         

