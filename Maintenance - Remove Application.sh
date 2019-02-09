#!/bin/bash

# This script can delete apps that are sandboxed and live in /Applications

# Get logged in User

loggedInUser=`/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }'`

# The first parameter is used to kill the app. It should be the app name or path
# as required by the pkill command.
applicationPath="$4"

if [[ -z "${applicationPath}" ]]; then
	echo "No application specified!"
	exit 1
fi

echo "Closing application: ${applicationPath}"

pkill "${applicationPath}"

echo "Removing application: ${applicationPath}"

rm -rf "/Applications/${applicationPath}.app"

# Remove properylists and preference files.
rm -rf "/Users/$loggedInUser/Library/Application\ Support/TextWrangler"
rm -rf "/Users/$loggedInUser/Library/Preferences/com.barebones.textwrangler.plist"
