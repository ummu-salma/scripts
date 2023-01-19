#!/bin/bash

## Script to intelligently create bulk mail accounts in Zimbra.
## Authors: Ummusalma
## Version: 1.0.0 20230119

# mail-users_list.txt file content should be of the following pattern:
# username1@example.com;passwd1;displayname1
# username2@example.com;passwd2;displayname2

#Users file
MAIL_LIST=mail-users_list.txt

#Create mail accounts

{ while IFS=';' read  u p d; do
	zmprov CreateAccount "$u" "$p" displayName "$d"
done ; } < $MAIL_LIST
