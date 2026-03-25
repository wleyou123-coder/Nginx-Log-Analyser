#!/bin/bash

echo 'Top 5 IP addresses with the most requests:'
cat nginx-access.log  | awk '{print $1}' | sort | uniq -c | sort -k1 -nr | head -n 5 | awk '{ print $2, "- " $1  " request"}'
echo -e '\n'

echo 'Top 5 most requested paths:'
cat nginx-access.log  | awk '{print $7}' | sort | uniq -c | sort -k1 -nr | head -n 5 | awk '{ print $2, "- " $1  " request"}'
echo -e '\n'

echo 'Top 5 response status codes:'
cat nginx-access.log | awk '{ print $9}' | sort | uniq -c | sort -nr -k1 | grep -E '200|404|304|400|403|405|301' | head -n 5 | awk '{ print $2,"- " $1 " requests"}'
echo -e '\n'

echo 'Top 5 user agents:'
cat nginx-access.log | awk -F'"' '{ print $(NF-1) }' | sort | uniq -c | sort -k1 -nr | head -n 5 | awk '{ print $2, " - " $1 " users"}' | column -t
