#!/bin/zsh

###
#
#            Name:  Self Service - Reset Bluetooth Settings.sh
#     Description:  Removes Bluetooth preferences and reset Bluetooth adapter
#         Created:  2020-02-05
#   Last Modified:  20XX-XX-XX
#         Version:  1.0
#
#
# Copyright 2019 Thijs Xhaflaire - bol.com bv.
#
###


########## variable-ing ##########

loggedInUser=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ && ! /loginwindow/ { print $3 }' )
bluetoothPlist="/Library/Preferences/com.apple.Bluetooth.plist"
userBluetoothPlist="com.apple.Bluetooth*"


########## main process ##########

## Removes Bleutooth Plist
/bin/rm -f $bluetoothPlist

## Removes ByHost Bluetooth Plist
/bin/rm -f /Users/$loggedInUser/Library/Preferences/ByHost/$userBluetoothPlist

