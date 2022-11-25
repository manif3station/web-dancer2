#!/bin/bash

mvu plugin install web-env

mkdir -p src/lib
ln -fs ../plugins/web-dancer2/src/lib/Web.pm src/lib/Web.pm

mkdir -p src/bin
ln -fs web-dancer2/app.psgi src/bin/app.psgi

mvu docker --enable dancer-config

if [[ $(mvu env) == "development" ]]; then
    mvu docker --enable development
fi 

ln -sf ../src/plugins/web-dancer2/Dockerfiles/base.yml docker-compose/base.yml
