#!/usr/bin/env bash

# Get the current date and time in HH:MM DD/MM/YYYY format
DATE=$(date '+%H:%M %d/%m/%Y')

# File to store details of newly detected hosts
NEW_HOSTS="172-16-10-new.txt"

# File containing known hosts to compare against
KNOWN_HOSTS="172-16-10-hosts.txt"

# Network range to scan
NETWORK="172.16.10.0/24"

# Network interface to use for the ARP scan
INTERFACE="br_public"

# Email addresses for alerting
FROM="" # Sender email
TO=""   # Recipient email

# Counters to track scan and detection iterations
i=0 # Scan iteration counter
k=0 # New host detection counter

# Check if the file for storing new hosts exists and is writable, create it if not
if [ ! -w "${NEW_HOSTS}" ]; then
    touch ${NEW_HOSTS}
fi

# Start an infinite loop to continuously monitor the network
while true; do

    echo "Performing an ARP scan against ${NETWORK}..."
    ((i++)) # Increment the scan iteration counter

    # Run an ARP scan on the specified network and interface, and process each line of output
    sudo arp-scan -x -I ${INTERFACE} ${NETWORK} | while read -r line; do

        # Extract the IP address from the scan output
        host=$(echo "${line}" | awk '{print $1}')

        # Check if the detected host is already in the known hosts file
        if ! grep -q "${host}" "${KNOWN_HOSTS}"; then
            ((k++)) # Increment the new host detection counter
            echo "Found a new host: ${host}!"

            # Log the newly detected host to the NEW_HOSTS file
            echo "${i}.${k}: ${host} at ${DATE}" >>${NEW_HOSTS}

            # Send an email alert about the newly detected host
            sendemail -f "${FROM}" \
                -t "${TO}" \
                -u "ARP Scan Notification" \
                -m "A new host was found: ${host}"
        fi

    done

    echo "No new host detected in this scan."

    # Wait for a random amount of time between 10 and 30 minutes before the next scan
    sleep_time=$((RANDOM % 20 + 10))
    echo "Sleeping for ${sleep_time} minutes..."
    sleep $((sleep_time * 60))

done
