#!/bin/bash

bat0=$(cat /sys/class/power_supply/BAT0/capacity)
bat1=$(cat /sys/class/power_supply/BAT1/capacity)

echo "  ${bat0}% |  ${bat1}% |"
