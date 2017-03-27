
## TZinfo
My name: **Prachi Patel**

Write what you did!
Remember that this report must include:

Vibhuti Patel and I are making an application on world clock. User can select time-zone ID and it will give current time and date depending on selected time zone. If the user doesn’t know the time zone ID then he can select ISO 3166 alpha-2 country code and it will return time zone IDs of selected country. we are using racket/gui and tzinfo libraries. tzinfo library doesn’t have much feature to explore but it satisfies major things for this project. TZInfo provides daylight savings aware transformations between times in different timezones.

The tzinfo library provides an interface for querying the Internet Assigned Numbers Authority time zone database. (utc-seconds->tzoffset) is useful method utinfo library has, because it takes time zone ID and number of seconds and returns the offset from UTC in effect at the moment of time in the given time zone. It is helpful when the selected time zone ID falls into a gap between offset, when daylight saving time starts or ends. 




![test image](/ps3-output.png?raw=true "output")

(all-tzids) returns a list containing all of the time zone IDs in the database. Country-code function take an argument of string of ISO 31166 alpha-2 country code, returns a list of time zone IDs. find-timezone function takes an argument of time zone ID, returns offset describing the offset from UTC in effect at that moment of time in the given time zone.
