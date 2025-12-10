#!/bin/bash

myIP=$(bash myIP.bash)


function helpMenu() {

	echo ""
	echo "    help menu    "
	echo "-----------------"
	echo "-n: add -n as an argument for this script to use nmap"
	echo "  -n external: External NMAP scan"
	echo "  -n internal: Internal NMAP scan"
	echo "-s: add -s as an argument for this script to use ss"
	echo "  -s external: External ss(netstat) scan" 
	echo "  -s internal: Internal ss(netstat) scan"
	echo ""
	echo "usage: ./networkchecker.bash <-n>/<-s> <external>/<internal>"
	echo "-----------------"
}

# Return ports that are serving to the network
function ExternalNmap(){
  rex=$(nmap "${myIP}" | awk -F"[/[:space:]]+" '/open/ {print $1,$4}' )
}

# Return ports that are serving to localhost
function InternalNmap(){
  rin=$(nmap localhost | awk -F"[/[:space:]]+" '/open/ {print $1,$4}' )
}


# Only IPv4 ports listening from network
function ExternalListeningPorts(){

# Todo-2: Complete the ExternalListeningPorts that will print the port and application
# that is listening on that port from network (using ss utility)

	externalPort=$(ss -ltpn | awk -F"[[:space:]:(),]+" '/'$myIP'/ {print $5,$9}' | tr -d "\"")

	echo "$externalPort"

}


# Only IPv4 ports listening from localhost
function InternalListeningPorts(){
ilpo=$(ss -ltpn | awk  -F"[[:space:]:(),]+" '/127.0.0./ {print $5,$9}' | tr -d "\"")
}



# Todo-3: If the program is not taking exactly 2 arguments, print helpmenu

if [ ! ${#} -eq 2 ]; then
	helpMenu

	exit 1
fi

# Todo-4: Use getopts to accept options -n and -s (both will have an argument)
# If the argument is not internal or external, call helpmenu
# If an option other then -n or -s is given, call helpmenu
# If the options and arguments are given correctly, call corresponding functions
# For instance: -n internal => will call NMAP on localhost
#               -s external => will call ss on network (non-local)

while getopts "n:s:" option; do
	case $option in
	n)
		if [[ "$2" == "internal" ]]; then
			InternalNmap
		elif [[ "$2" == "external" ]]; then
			ExternalNmap
		else
			helpMenu
		fi
	;;
 	s)
		if [[ "$2" == "internal" ]]; then
			InternalListeningPorts
		elif [[ "$2" == "external" ]]; then
			ExternalListeningPorts
		else
			helpMenu
		fi
	;;
	\?)
		helpMenu
	esac
done
