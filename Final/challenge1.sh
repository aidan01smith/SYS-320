#!/bin/sh

# call the web page

curl -s http://10.0.17.47/IOC.html > IOC.html

# sort through the html to get the text from it

grep -oP '(?<=<td>).*?(?=</td>)' IOC.html | awk 'NR % 2 == 1' > IOC.txt

rm IOC.html

