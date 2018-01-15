#!/bin/bash

git pull
docker rm -f blog
./_shell/build.sh
cd _site
git add -A
git commit -m "update from source"
git push
