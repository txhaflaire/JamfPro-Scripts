#!/bin/bash

loggedInUser=$(/usr/bin/stat -f%Su /dev/console)
loggedInUserHome=$(/usr/bin/dscl . -read /Users/$loggedInUser NFSHomeDirectory | /usr/bin/awk '{print $NF}') 
outputFileName="$loggedInUserHome/Desktop/$loggedInUser-DiskUsage.txt"


# Display free space
FreeSpace=$( /usr/sbin/diskutil info "Macintosh HD" | /usr/bin/grep  -E 'Free Space|Available Space' | /usr/bin/awk -F ":\s*" '{ print $2 }' | awk -F "(" '{ print $1 }' | xargs )
FreePercentage=$( /usr/sbin/diskutil info "Macintosh HD" | /usr/bin/grep -E 'Free Space|Available Space' | /usr/bin/awk -F "(\\\(|\\\))" '{ print $6 }' )
diskSpace="Disk Space: $FreeSpace free ($FreePercentage available)"
mostData=$( du -ah /Users/$loggedInUser | sort -rh | head -6 )


## Format information #####


displayInfo="----------------------------------------------
Warning your disk space on boot volume has passed the 85%.

We are going to flush user caches and system caches =)

$diskSpace
----------------------------------------------
Here are your biggest five directories!

$mostData


The generate report button will generate a report on your desktop, this can take
approxamitly 45 seconds.
----------------------------------------------"



## Display information to end user #####


runCommand="button returned of (display dialog \"$displayInfo\" with title \"Storage Information\" with icon file posix file \"/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/SidebarInternalDisk.icns\" buttons {\"Generate report\", \"OK\"} default button {\"OK\"})"

clickedButton=$( /usr/bin/osascript -e "$runCommand" )



## Run additional commands #####


if [ "$clickedButton" = "Generate report" ]; then
	
	# Generate report
	mostData=$( du -ah /Users/$loggedInUser | sort -rh | head -6 >> $outputFileName )

	
	
fi


exit 0
