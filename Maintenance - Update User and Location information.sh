#!/bin/sh

loggedInUser=`/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }'`

echo "Running recon for $loggedInUser `date`..."

#Run recon, submitting the users username which as of 8.61+ can then perform an LDAP lookup
sudo jamf recon -endUsername $loggedInUser

echo "Finished running recon for $loggedInUser `date`..."
