#!/bin/bash

echo maven-project > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth
scp -i /opt/prod /tmp/.auth produser@54.242.104.185:/tmp/.auth
scp -i /opt/prod ./jenkins/deploy/publish.sh produser@54.242.104.185:/tmp/publish.sh
ssh -i /opt/prod produser@54.242.104.185 "/tmp/publish.sh"
