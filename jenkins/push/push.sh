#!/bin/bash

echo "************************"
echo "*** PUSHING IMAGE ******"
echo "*************************"

IMAGE="maven-project"

echo "** LOgining in ***"
docker login -u enes789 -p $PASS
echo "**** Tagging IMage ** "
docker tag $IMAGE:$BUILD_TAG enes789/$IMAGE:$BUILD_TAG
echo "**** Pushin image ***"
docker push enes789/$IMAGE:$BUILD_TAG
