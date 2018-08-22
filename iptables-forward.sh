#!/bin/bash

# Simple script for port forwarding with iptables
# Example: use a bastion host that will receive a connection on port 80 and it will redirect to a internal host that has no internet access
# In case that client can't connect directly to the server
# client -> bastion -> server

echo 1 > /proc/sys/net/ipv4/ip_forward

iptables -F
iptables -t nat -F
iptables -X

iptables -t nat -A PREROUTING -p tcp --dport $PORT -j DNAT --to-destination $DEST_IP:$PORT
iptables -t nat -A POSTROUTING -p tcp -d $DEST_IP --dport 8080 -j SNAT --to-source $SOURCE_IP
