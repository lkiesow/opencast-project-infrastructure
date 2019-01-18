#!/bin/bash

set -uxe

DOCKER_OWNER=greglogan
TAG=v1.7.0

doBuild() {
  bash build-container.sh $DOCKER_OWNER $1 $2 $TAG
}

doBuildWorker() {
  doBuild $1 run
  doBuild $1 build
  doBuild $1 doc
  doBuild $1 package
  doBuild $1 worker
}

doBuildWorker deb9
doBuildWorker cent7

