#!/bin/bash

iconFileName="$4"
header="$5"
description="$6"
URL="$7"
Button1="$8"
Button2="$9"
consoleuser=`ls -l /dev/console | cut -d " " -f4`


HELPER=`/Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType utility -heading "$5" -description "$6" -button1 "$8" -button2 "$9" -cancelButton "2" -icon "$4"`


		echo "jamf helper result was $HELPER";

		if [ "$HELPER" == "0" ]; then
			open "$7"
			exit 0
		else
			jamf displayMessage -message "No problem, We will remind you later.";   
	  exit 0
		fi
