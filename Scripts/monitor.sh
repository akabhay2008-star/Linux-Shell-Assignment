#!/bin/bash
# --------------------------------------------------------
# Script Name : monitor.sh
# Purpose     : Log CPU and Memory usage every few seconds
# Author      : Abhay Kumar
# Date        : 2025-11-16
# --------------------------------------------------------

# Ask user for time interval
echo "Enter time interval in seconds:"
read INTERVAL

# Log file location
LOG_FILE="$HOME/usage_log.txt"

echo "Monitoring started... (Press Ctrl + C to stop)"
echo "Saving data to $LOG_FILE"
echo "-------------------------------------------" >> "$LOG_FILE"

# Infinite loop
while true
do
    # Current time
    TIME_NOW=$(date +"%Y-%m-%d %H:%M:%S")

    # CPU usage (%)
    CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}')

    # Memory usage (used/total)
    MEM_USED=$(free -m | awk '/Mem:/ {print $3}')
    MEM_TOTAL=$(free -m | awk '/Mem:/ {print $2}')

    # Save to log file
    echo "$TIME_NOW  CPU: $CPU% | MEMORY: $MEM_USED MB of $MEM_TOTAL MB" >> "$LOG_FILE"

    sleep "$INTERVAL"
done
