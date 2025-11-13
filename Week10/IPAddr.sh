#!/bin/bash

ip addr | grep "/24 brd" | grep -o -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" | grep -v ".255"
