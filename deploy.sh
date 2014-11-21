#! /bin/bash

SHA1=$1

# Deploy image to Docker Hub
#docker push danielnbarbosa/noke-nginx:$SHA1
docker push danielnbarbosa/noke-nginx

# Deploy to CoreOS cluster
ssh core@54.67.14.65 -C 'fleetctl stop noke-nginx@{1..3}.service; fleetctl start noke-nginx@{1..3}.service'
