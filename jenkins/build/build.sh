#!/bin/bash

cp -f java-app/target/*.jar jenkins/build/

echo "******************************"
echo "*** Building Docker IMage ***"
echo "******************************"

cd jenkins/build/ && docker-compose -f docker-compose-build.yml build --no-cache
