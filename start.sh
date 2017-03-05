#!/bin/bash
### VARIABLES
ip_address="192.168.254.110"

curl http://$ip_address/control?cmd=Servo,1,0,10
sleep 2
curl http://$ip_address/control?cmd=Servo,1,0,100
