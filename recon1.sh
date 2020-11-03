#!/bin/bash

#This clears your screen
clear

#This adds some empty lines
echo
echo
echo
echo
echo

#This asks you for the first name of the person
echo "Please enter the FIRST NAME of the person:"
read fname 

#This asks you for the last name of the person
echo "Please enter the LAST NAME of the person"
read lname

#This asks you for the dns you want to perform a recon on
echo "Enter the name of the website you want to find the DNS for:"
echo "target.com"
read dns

#This checks if the DNS name is empty
if [ -z $dns ];then
	echo "We need a real website."
	exit

#This checks if the person name is empty 
elif [ -z $fname ] ;then
	echo "We need some real names."
	exit
elif [ -z $lname ];then
	echo "We need some real names."
	exit
	
#This is the code for recon
else
	echo "The dns report will open in a new tab." ;
	
	firefox https://publicrecords.searchsystems.net/search-result.php?$fname=$fname&$lname=$lname&state= ;
	sleep 1;
	
	firefox --new-tab https://thatsthem.com/name/$fname-$lname;
	sleep 3;
	
	firefox --new-window https://viewdns.info/dnsreport/?domain=$dns
	sleep 1;
	
	firefox --new-tab https://mxtoolbox.com/SuperTool.aspx?action=dns%3a$dns&run=toolpage

fi
