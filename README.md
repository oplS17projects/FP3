# FP3: Final Project Assignment 3: Exploration 2

## URL/NET, HTML, HTML-PARSING
My name: **David DaCosta**

  For this exploration I chose to work with the url/net, html-parsing, & html libraries. Jacob Adamson & I are doing a Fake News generator so I'm doing these libraries to try to scrape some information off of some websites. I posted in the OPL group forums asking if other students were using these libraries so that we could discuss some of it because I have done web scraping & I did not have an easy time working with these libraries but nobody responded. 
  For my approach, I created ports of 5 websites: NPR, Huffington Post, Washington Post,USA Today, & CNN. I created the ports using the get-pure-port function & the string-url function ala Professor Fred's example in FP1. Then I converted the ports to (html) objects using the read-html function. I then rewrote the extract pcdata & extract pcdata-from-html-element functions to grab the source code from these html objects. I then created a list of the five html objects & called an iterator function to loop through the list & print out all of the site's sources using the extract pcdata function. What I wish I had completed was pulled specific parts of the site like the Title, Header & Footer. However I did not find much assistance in terms of accomplishing this. 

The following is some of the tail end of the source for washington posts website followed by the "done" that prints when the loop terminates on nul.
![realnewsorfake](/realnewsorfake.png?raw=true "FAKE NEWS")
