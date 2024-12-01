#!/usr/bin/env bash

# Exit codes
ARGUMENT_ERROR=1
PING_SUCCESS=0
PING_FAILURE=2

# Check for arguments
if [ "$#" -ne 2 ]; then
    echo "Error: Two arguments required: <name> <domain>"
    exit $ARGUMENT_ERROR
fi

# Assign arguments to variables
NAME="$1"
DOMAIN="$2"
CSV_FILE="ping_results.csv"

# Ping the domain
ping -c 1 "$DOMAIN" &>/dev/null

if [ $? -eq 0 ]; then
    PING_STATUS="success"
else
    PING_STATUS="failure"
fi

# Get the current date and time
CURRENT_DATETIME=$(date +"%Y-%m-%d %H:%M:%S")

# Write to CSV file
if [ ! -f "$CSV_FILE" ]; then
    # Add header if file doesn't exist
    echo "Name,Domain,PingResult,DateTime" >"$CSV_FILE"
fi

# Append the results
echo "$NAME,$DOMAIN,$PING_STATUS,$CURRENT_DATETIME" >>"$CSV_FILE"

# Indicate the result
if [ "$PING_STATUS" == "success" ]; then
    echo "Ping to $DOMAIN was successful."
    exit $PING_SUCCESS
else
    echo "Ping to $DOMAIN failed."
    exit $PING_FAILURE
fi
