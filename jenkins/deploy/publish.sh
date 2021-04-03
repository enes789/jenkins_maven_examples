#!/bin/bash

export IMAGE=$(sed -n '1p' /tmp/.auth)
export TAG=$(sed -n '2p' /tmp/.auth)
export PASS=Davutha12


docker login -u enes789 -p $PASS

cd /home/produser/maven && docker-compose up -d
