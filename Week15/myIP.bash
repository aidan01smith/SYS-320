#!/bin/sh

ip_result=$(ip a | grep "brd" | grep "inet")

filtered_ip=$(echo $ip_result | cut -d ' ' -f 2 | cut -d '/' -f 1)

echo $filtered_ip
