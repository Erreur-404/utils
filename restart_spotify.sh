#!/bin/bash

killall spotify
sleep 3 
spotify &
while
	playerctl -p spotify play 2>&1
	state=$(playerctl -p spotify status 2>&1)
	[ "$state" = "Paused" ] || [ "$state" = "Stopped" ] || [ "$state" = "No player could handle this command" ] || [ "$state" = "No players found" ];
do true; done
