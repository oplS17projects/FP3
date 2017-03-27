#lang racket
 (require tzinfo)


; Returns a list containing all of the time zone IDs in the database
(all-tzids)

; returns a list of time zone IDs that are used in the country identified by
;the given ISO 3166 alpha-2 country code.
(define (country-code c_name)
  (country-code->tzids c_name))

(define (find-timezone a)
  (utc-seconds->tzoffset a (current-seconds)))

(find-timezone "America/New_York")

; returns the ID of the current system time-zone
; (system-tzid)

; if the given local time falls into a gap between different offsets
;(e.g. when an hour is skipped at the start of daylight saving time in
; most parts of the United States)
(local-seconds->tzoffset "America/New_York" 1394330400)

;the end of daylight saving time, when an hour is repeated
(local-seconds->tzoffset "America/New_York" 1414890000)