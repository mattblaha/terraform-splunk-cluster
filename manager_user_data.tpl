#!/bin/bash
set -x

ID=$(curl http://169.254.169.254/latest/meta-data/instance-id)

sleep 90

# Start service and Enable autostart
sudo /opt/splunk/bin/splunk enable boot-start -user splunk --accept-license
sudo -u splunk /opt/splunk/bin/splunk edit cluster-config -mode manager -replication_factor 4 -search_factor 3 -secret your_key -cluster_label cluster1 -auth "admin:SPLUNK-$ID"
sudo systemctl restart splunk
