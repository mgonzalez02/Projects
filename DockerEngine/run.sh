#!/bin/bash
CX_SERVER_TAR=./cx-engine-server.tar
CX_SERVER_ENV=./server.env

echo loading checkmarx engine server image
docker load < $CX_SERVER_TAR
echo deploying checkmarx engine server container
docker run --env-file $CX_SERVER_ENV -d -p 0.0.0.0:8088:8088 cx-engine-server
