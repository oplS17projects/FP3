# FP3: Final Project Assignment 3: Exploration 2
Due Sunday, March 26, 2017

## 2htdp/image and net/url
My name: **Cameron Campbell**

I expanded on my FP1 program (list YouTube's top trending videos with net/url) by finding each thumbnail image for the YouTube titles, and displaying the image with 2htdp/image. I also added the view count, so each Title wrapped in a list, with a list to have an image, a title, and a view count. This is a portion the 2htdp/image code:
```racket
(bitmap/url (bytes->string/locale (regexp-replace clean-img (car (regexp-match img-regex myport)) ""))
```
*bitmap/url* is from the 2htdp/image library. It takes a url (string) to an image and downloads that image so it can be displayed.
regexp seems to return everything in Bytes type, so *bytes->string/locale* is used to get a string form of the image url.

The string to find the regex starting point:
```racket
(define locate-regex #px"class=\"item-section\">")
```
This is matched twice before I start regexp-matching thumbnails, titles, and view counts.

![screenshot](/screenshot.jpg?raw=true "screenshot")
- YouTube Weekly trending videos
