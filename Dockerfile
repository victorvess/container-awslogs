FROM debian:buster-slim

RUN apt-get update && apt-get install -y curl && \
        curl -O https://s3.amazonaws.com/amazoncloudwatch-agent/debian/amd64/latest/amazon-cloudwatch-agent.deb && \
        dpkg -i -E ./amazon-cloudwatch-agent.deb  && \
        mkdir -p /awslogs

COPY scripts/agent.sh /opt/aws/amazon-cloudwatch-agent/bin/agent.sh
COPY config/config.json /awslogs/config.json

CMD /opt/aws/amazon-cloudwatch-agent/bin/agent.sh
