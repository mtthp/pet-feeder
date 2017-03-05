#!/bin/bash
### CONSTANTS
RED='\033[0;31m' # http://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
ORANGE='\033[0;33m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

### VARIABLES
starting_file="$(pwd)/start.sh"

### EXECUTION
if [ -f "$starting_file" ]; then
	cronjob="00 00 06 12 * $starting_file"
	if crontab -l | grep -q "$starting_file"; then
        	echo -e "${RED}Failed : ${BLUE}$starting_file${NC} is already in crontab. Remove it first."
	else
		echo -e "${GREEN}Success : ${BLUE}$starting_file${NC} added to crontab."
		(crontab -l && echo "$cronjob") > crontab.tmp && crontab crontab.tmp && rm crontab.tmp 
		exit 0;
	fi
else
	echo -e "${RED}Failed : ${BLUE}$starting_file${NC} does not exists."
fi

exit 1;
