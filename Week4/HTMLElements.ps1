<#

# deliverable 1
$scraped_page = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.49/ToBeScraped.html

# Get a count of the links on the page
$scraped_page.Links.Count

# deliverable 2
$scraped_page = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.49/ToBeScraped.html

# Get the links as HTML element
$scraped_page.Links

# deliverable 3

$scraped_page = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.49/ToBeScraped.html

# Display only URL and its text
$scraped_page.Links | select outerText, href

# deliverable 4
$scraped_page = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.49/ToBeScraped.html

# Get outer text of every element with the tag h2
$h2s = $scraped_page.ParsedHtml.body.getElementsByTagName("h2") | Select-Object outerText
$h2s
#>

# deliverable 4

$scraped_page = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.49/ToBeScraped.html

# Get outer text of every element with the tag h2
$divs1 = $scraped_page.ParsedHtml.body.getElementsByTagname("div") | where { `
$_.getAttributeNode("class").Value -ilike "div-1"} | select innerText
$divs1