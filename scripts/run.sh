#!/bin/bash

set -e

root="$( pwd )"
echo "Root dir [${root}]"

# kill running docker
echo "Killing existing apps"
docker-compose kill || echo "Nothing to stop"

# update the yml
echo "Updating configuration"
"${root}"/scripts/update_prometheus.sh

# start docker
echo "Starting apps"
docker-compose up -d

echo -e "\n\n\n"
echo "Prometheus is running at [9090]"
echo "Prometheus Node Exporter is running at [9100]"
echo "Prometheus Alert Manager is running at [9093]"
echo "Google cadvisor is running at [8080]"
echo "Grafana is running at [3000], login with [admin/foobar]"
echo "Grafana dashboard is available under [dashboards/sc-netflix.json]"