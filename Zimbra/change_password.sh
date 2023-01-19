#!/bin/bash

## Script to intelligently change passwords of bulk mail accounts in Zimbra.
## Authors: Ummusalma
## Version: 1.0.0 20230119

# mail_user_pass_list.txt file content should be of the following pattern:
# username1@example.com;passwd1
# username2@example.com;passwd2

# Users file
MAIL_LIST=mail_user_pass_list.txt

# Change password
{ while IFS=';' read  u p; do 
zmprov sp "$u" "$p"
done ; } < $MAIL_LIST
