#!/bin/sh

# Strating Kafka connect

echo -e "Current file contents:\n $(cat /etc/hosts)"
echo "$DETECTED_IP $DETECTED_HOSTNAME" >> /etc/hosts
echo -e "\n\n\nUpdated file contents:\n $(cat /etc/hosts)"

echo $BROKERS $GROUP
sed -i "s/BROKERS/${BROKERS}/g" /opt/connect-distributed.properties
sed -i "s/BROKER_USER/${BROKER_USER}/g" /opt/connect-distributed.properties
sed -i "s/BROKER_PASSWORD/${BROKER_PASSWORD}/g" /opt/connect-distributed.properties
sed -i "s/GROUP/${GROUP}/g" /opt/connect-distributed.properties
sed -i "s/SCHEMA_REGISTRY_URL/${SCHEMA_REGISTRY_URL}/g" /opt/connect-distributed.properties
sed -i "s/SCHEMA_REGISTRY_URL/${SCHEMA_REGISTRY_URL}/g" /opt/connect-distributed.properties
sed -i "s/SCHEMA_REGISTRY_KEY/${SCHEMA_REGISTRY_KEY}/g" /opt/connect-distributed.properties
sed -i "s/SCHEMA_REGISTRY_SECRET/${SCHEMA_REGISTRY_SECRET}/g" /opt/connect-distributed.properties

echo Starting Kafka connect

cd "/opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}/bin"
export KAFKA_OPTS="-javaagent:/opt/jmx_prometheus_javaagent-${JMX_AGENT_VERSION}.jar=3600:/opt/kafka-connect.yml"
./connect-distributed.sh /opt/connect-distributed.properties