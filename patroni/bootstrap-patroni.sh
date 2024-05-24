#!/bin/bash

echo 'Waiting for consul...'
until $(curl --output /dev/null --silent --head --fail http://localhost:8500); do
    sleep 3
done
echo '------------------------------ Starting patroni ------------------------------'
chmod 0600 /etc/patroni/certs/server.key
chown -hR postgres:postgres /etc/patroni/certs
HOME=$HOME USER=$USER /usr/bin/python3 /usr/bin/patroni /etc/patroni/postgres.yml 2>&1
echo '------------------------------ Patroni finished ------------------------------'
