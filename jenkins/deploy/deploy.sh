#!/bin/bash

echo maven-project > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth
scp -i /opt/prod /tmp/.auth produser@18.234.149.11:/tmp/.auth
scp -i /opt/prod ./jenkins/deploy/publish.sh produser@18.234.149.11:/tmp/publish.sh
ssh -i /opt/prod produser@18.234.149.11 "/tmp/publish.sh"
