#! /bin/bash

# Deploy image to Docker Hub
docker push danielnbarbosa/noke-nginx

# Rolling deploy to CoreOS cluster
UNIT=noke-nginx
SLEEP=3
USER=core
HOST=54.67.14.65

scp ${UNIT}@.service ${USER}@${HOST}:
ssh ${USER}@${HOST} -C "fleetctl destroy ${UNIT}@.service  && sleep $SLEEP && fleetctl submit ${UNIT}@.service && sleep $SLEEP"
ssh ${USER}@${HOST} -C "fleetctl destroy ${UNIT}@1.service && sleep $SLEEP && fleetctl start ${UNIT}@1.service && sleep $SLEEP"
ssh ${USER}@${HOST} -C "fleetctl destroy ${UNIT}@2.service && sleep $SLEEP && fleetctl start ${UNIT}@2.service && sleep $SLEEP"
ssh ${USER}@${HOST} -C "fleetctl destroy ${UNIT}@3.service && sleep $SLEEP && fleetctl start ${UNIT}@3.service && sleep $SLEEP"
