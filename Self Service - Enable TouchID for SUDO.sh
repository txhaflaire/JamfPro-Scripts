#!/bin/zsh

TouchBar=$(ioreg | grep "AppleEmbeddedOSSupportHost")

if [[ $TouchBar == "AppleEmbeddedOSSupportHost" ]] ; then
	sed -i '' '2i\
	auth	   sufficient     pam_tid.so
	' ~/Desktop/sudo
else
	echo "<result>No TouchBar</result>"
fi
