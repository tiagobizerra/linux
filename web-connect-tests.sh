#!/bin/bash
# Script to test connectivity to web services
# Install dependencies
#yum -y install curl mtr tcptraceroute bind-utils
#apt-get install curl mtr tcptraceroute bind9-host 

URL=electricity.volta-monitoring.com

publicip=`dig +short myip.opendns.com @resolver1.opendns.com`
echo "=== Testing access to $URL ===\n"
echo "Public IP is: $publicip\n"
echo "Public IP location:"
curl ipinfo.io/$publicip

echo "\nTesting access to $URL\n"
echo "DNS resolution:\n"
echo "Local DNS:"
host $URL

echo "\n\nCloudFare DNS:"
host $URL 1.1.1.1

echo "\n\nGoogle DNS:"
host $URL 8.8.8.8

echo "\n\nWeb Access to url $URL:"
echo "\nPort 80\n"
curl http://$URL
echo "\nPort 443\n"
curl https://$URL

echo "\n\nMTR test:"
mtr --report $URL

echo "\nTracing route to TCP port 80:"
tcptraceroute $URL 80

echo "Tracing route to TCP port 443:"
tcptraceroute $URL 443