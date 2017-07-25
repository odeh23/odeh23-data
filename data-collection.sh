#!/bin/bash
#List of Survey Questions
echo "What is your favorite fruit?"
read FRUIT
echo "What is your favorite color?"
read COLOR
echo "How old are you?"
read AGE
echo "Do you like rice or pasta better?"
read GRAINS
echo "How tall are you?"
read HEIGHT
# get the current time/date
TIMESTAMP=`date --iso-8601=seconds`
# Create unique identifier
IDENTIFIER="`echo $RANDOM$RANDOM$RANDOM | sha1sum | sed 's/[^0-9a-fA-F]//g' | sed -e 's/^/0x/'`"
# Write Data to tmp.csv
echo "$IDENTIFIER,$TIMESTAMP,$FRUIT,$COLOR,$AGE,$GRAINS,$HEIGHT" > ./tmp.csv
# Read Out The Data in CSV File
cat ./tmp.csv
# Write Data To Database
bash ./write-to-database.sh
# Back Up Data
cat ./tmp.csv >> data-backup.csv
# Remove temp file
rm tmp.csv