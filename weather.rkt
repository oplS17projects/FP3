#lang racket
(require net/url json 2htdp/batch-io)

;;; Notes:
;;; weather_data folder must exist before pulling remote data

;;; TODO:
;;; Pull data only if current data is old/missing
;;; Implement forecast

(define current-weather-url "http://api.openweathermap.org/data/2.5/weather?q=")
(define options "&mode=json&units=imperial")
(define key "&appid=4fa122890f85654e87db8a6218f1b109")


(define (get-current-weather city state-country)
  (define (openweathermap city state-country)
    (string-append current-weather-url (location-format city state-country) options key))
  
  (define (location-format city state-country)
    (string-append city "," state-country))

  (define file-path (string-append "weather_data/current/" city " - " state-country ".json"))
  (define remote-data (port->string (get-pure-port (string->url (openweathermap city state-country)))))

  (write-file file-path remote-data)
  )


(define (parse-current-weather city state-country)
  (define filename (string-append "weather_data/current/" city " - " state-country ".json"))
  (define json-data (call-with-input-file filename read-json))
  (define current-weather (list
                   (cons "city" (hash-ref json-data 'name))
                   (cons "current" (hash-ref (hash-ref json-data 'main) 'temp))
                   (cons "high" (hash-ref (hash-ref json-data 'main) 'temp_max))
                   (cons "low" (hash-ref (hash-ref json-data 'main) 'temp_min))
                   (cons "humidity" (hash-ref (hash-ref json-data 'main) 'humidity))
                   (cons "wind" (/ (hash-ref (hash-ref json-data 'wind) 'speed) 0.3048))
                   (cons "description" (hash-ref (car (hash-ref json-data 'weather)) 'main))
                   ))
  current-weather
  )



