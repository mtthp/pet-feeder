#!/bin/bash
### CONSTANTS
RED='\033[0;31m' # http://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
ORANGE='\033[0;33m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

### VARIABLES
starting_file="$(pwd)/start.sh"
cron_time="00 08 * * *"

### EXECUTION
if [ -f "$starting_file" ]; then
	cronjob="$cron_time $starting_file"
	if crontab -l | grep -q "$starting_file"; then
        	echo -e "${RED}Failed : ${CYAN}$starting_file${NC} is already in crontab.\nRemove it first using ${CYAN}crontab -e${NC}."
	else
		echo -e "${GREEN}Success : ${CYAN}$starting_file${NC} added to crontab."
		(crontab -l && echo "$cronjob") > crontab.tmp && crontab crontab.tmp && rm crontab.tmp 
		exit 0;
	fi
else
	echo -e "${RED}Failed : ${CYAN}$starting_file${NC} does not exists."
fi

exit 1;
