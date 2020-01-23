#!/bin/bash

usage() {
    echo " $0 usage:"
    echo " APPLY: ${0} <hostname> <host_ip> <public_ip>"
    echo " REVERT: ${0} <hostname> <host_ip> <public_ip> revert"
}

if [[ ${#@} -lt 4 ]]; then
    usage
fi

HOSTNAME=$1
HOST_IP=$2
PUBLIC_IP=$3

if [[ $4 == 'revert' ]]; then
    echo "Changing HOSTNAME from $HOSTNAME"
    find . -type f -print0 | xargs -0 sed -i "s/$HOSTNAME/{HOSTNAME}/g"
    echo "Changing HOST_IP from $HOST_IP"
    find . -type f -print0 | xargs -0 sed -i "s/$HOST_IP/{HOST_IP}/g"
    echo "Changing PUBLIC_IP from $PUBLIC_IP"
    find . -type f -print0 | xargs -0 sed -i "s/$PUBLIC_IP/{PUBLIC_IP}/g"
else
    echo "Changing HOSTNAME to $HOSTNAME"
    find . -type f -print0 | xargs -0 sed -i "s/{HOSTNAME}/${HOSTNAME}/g"
    echo "Changing HOST_IP to $HOST_IP"
    find . -type f -print0 | xargs -0 sed -i "s/{HOST_IP}/${HOST_IP}/g"
    echo "Changing PUBLIC_IP to $PUBLIC_IP"
    find . -type f -print0 | xargs -0 sed -i "s/{PUBLIC_IP}/${PUBLIC_IP}/g"
fi

