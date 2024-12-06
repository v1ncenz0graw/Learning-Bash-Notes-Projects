#!/usr/bin/env bash

KNOWN_HOSTS="172-16-10-hosts.txt"
NETWORK="172.16.10.0/24"
INTERFACE="br_public"

FROM=""
TO=""

# starting infinite loop
while true; do

    echo "Performing an ARP scan against ${NETWORK}..."

    # scans defined NETWORK range with defined INTERFACE with ARP-SCAN
    sudo arp-scan -x -I ${INTERFACE} ${NETWORK} | while read -r line; do

        host=$(echo "${line}" | awk '{print $1}')

        # Checks for any new device
        if ! grep -q "${host}" "${KNOWN_HOSTS}"; then

            echo "Found a new host: ${host}!"
            echo "${host}" >>"${KNOWN_HOSTS}"

            # Sends Alert to EMAIL
            sendemail -f "${FROM}" \
                -t "${TO}" \
                -u "ARP Scan Notification" \
                -m "A new host was found: ${host}"
        fi

    done

    echo "No new host detected"

    # Random sleep time between 10 and 30 minutes
    sleep_time=$((RANDOM % 20 + 10))
    echo "Sleeping for ${sleep_time} minutes..."
    sleep $((sleep_time * 60))

done
