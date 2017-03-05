#!/bin/bash
### VARIABLES
ip_address="192.168.254.220"
range=90 # degrees
delay=2 # seconds

curl http://$ip_address/control?cmd=Servo,1,0,$((10+$range))
sleep $delay
curl http://$ip_address/control?cmd=Servo,1,0,10
