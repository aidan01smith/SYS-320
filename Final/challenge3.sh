#!/bin/sh

#check if the report file exists
if [ ! -f "report.txt" ]; then
	echo "the report file for this does not exist. please make one"
	exit 1
fi


#creating the html table

cat << EOF > /var/www/html/report.html
<!DOCTYPE html>
<html>
<head>
<title>IOC Report</title>
<style>
table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  border: 1px solid black;
  padding: 8px;
  text-align: left;
}

th {
  background-color: #f2f2f2;
}
</style>
</head>
<body>

<h2>IOC Report</h2>

<table>
  <tr>
    <th>IP Address</th>
    <th>Date/Time</th>
    <th>Page Accessed</th>
  </tr>
EOF


# use the dfata from the report

while IFS= read -r line; do

	ip=$(echo "$line" | awk '{print $1}')
	date_and_time=$(echo "$line" | awk '{print $2}')
	page_accessed=$(echo "$line" | awk '{print $NF}')
	echo "<tr><td>$ip</td><td>$date_and_time</td><td>$page_accessed</td></tr>" >> /var/www/html/report.html
done < report.txt


cat << EOF >> /var/www/html/report.html
</table>

</body>
</html>
EOF



