#!/bin/bash

allLogs=""
file="/var/log/apache2/access.log"

function getAllLogs(){
allLogs=$(cat "$file" | cut -d' ' -f1,4,7 | tr -d "[")
}


# to call the function, just use its name: getAllLogs

function pageCount(){
	pagesAccessed=$(awk '{print $7}' "$file" | sort | uniq -c | sort -nr)

	echo "$pagesAccessed"
}

# pageCountResults=$(pageCount)
# echo "$pageCountResults"

function countingCurlAccess(){
	curlAccess=$(cat "$file" | cut -d' ' -f1,12 | tr -d "[")
	echo "$curlAccess"
}

countingResults=$(countingCurlAccess)
echo "$countingResults"
