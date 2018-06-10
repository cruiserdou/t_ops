#!/bin/bash

function stopntpd {
    sh main.sh stopntpd
}

function esysctl {
    sh main.sh esysctl
}

PS3="Enter option: "
select option in "Stop ntpd" "Modify sysctl" "Exit program"
do
    case $option in
    "Exit program")
        break;;
    "Stop ntpd")
        stopntpd ;;
    "Modify sysctl")
        esysctl;;
    *)
        clear
        echo "Sorry, wrong selection";;
    esac
done
clear