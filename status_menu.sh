#!/bin/bash

##
# Color  Variables
##
green='\e[32m'
blue='\e[34m'
clear='\e[0m'

##
# Color Functions
##

ColorGreen(){
	echo -ne $green$1$clear
}
ColorBlue(){
	echo -ne $blue$1$clear
}

##
# BASH menu script that checks:
#   - Memory usage
#   - CPU load
#   - Number of TCP connections
#   - Kernel version
##

server_name=$(hostname)

function memory_check() {
	echo "Memory usage on ${server_name} is: " && free -h
}

function cpu_check() {
	echo "CPU load on ${server_name} is: " && uptime
}

function tcp_check() {
	echo "TCP connections on ${server_name}: " && cat  /proc/net/tcp | wc -l
}

function kernel_check() {
	echo "Kernel version on ${server_name} is: " && uname -r
}

function all_checks() {
	memory_check
	cpu_check
	tcp_check
	kernel_check
}

menu() {

echo -ne "
Server Details of $(hostname)
$(ColorGreen '1)') Memory usage
$(ColorGreen '2)') CPU load
$(ColorGreen '3)') Number of TCP connections
$(ColorGreen '4)') Kernel version
$(ColorGreen '5)') Check All
$(ColorGreen '0)') Exit
$(ColorBlue 'Choose an option:') "
        read option
        case $option in
	        1) memory_check ; menu ;;
	        2) cpu_check ; menu ;;
	        3) tcp_check ; menu ;;
	        4) kernel_check ; menu ;;
	        5) all_checks ; menu ;;
			    0) exit 0 ;;
			    *) echo -e $red"Wrong option."$clear; WrongCommand;;
        esac
}

menu