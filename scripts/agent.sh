#!/bin/bash

set -e

# Expect that /awslogs/config.json is mounted into container with valid cloudwatch config from
#  https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Agent-Configuration-File-Details.html

/opt/aws/amazon-cloudwatch-agent/bin/config-translator -input /awslogs/config.json -output /opt/aws/amazon-cloudwatch-agent/etc/CWAgent.conf

exec /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent -config /opt/aws/amazon-cloudwatch-agent/etc/CWAgent.conf

