#!/bin/bash

## This script is to take backup of a postgres Database from a container and then push it to S3 bucket.

#Configuration
CONTAINER_NAME="container_name"
FILENAME="db_name-`date +%Y-%m-%d`.dump"
DUMPS_FOLDER="/home/ubuntu/backupdb/"

#Backup DB from docker container
docker exec $CONTAINER_NAME sh -c "pg_dump --username=db_username -Fc db_name > /tmp/$FILENAME"
docker cp $CONTAINER_NAME:/tmp/$FILENAME $DUMPS_FOLDER
docker exec $CONTAINER_NAME sh -c "rm /tmp/$FILENAME"

#push backup to AWS S3 bucket
/usr/local/bin/aws --profile profile_name s3 sync /home/ubuntu/backupdb/ s3://backups/$(date +%a)/db-backups
