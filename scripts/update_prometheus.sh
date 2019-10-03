#!/bin/bash

set -e

root="$( pwd )"
echo "Root dir [${root}]"

my_ip="$( "${root}"/scripts/whats_my_ip.sh )"
echo "Replacing prometheus.yml with your ip [${my_ip}]"

cp -f "${root}"/prometheus/prometheus_template.yml "${root}"/prometheus/prometheus.yml
sed -i -e "s/YOUR_IP/$my_ip/g" "${root}"/prometheus/prometheus.yml