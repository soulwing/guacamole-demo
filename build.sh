#!/bin/bash

docker image build -t guacamole-demo-proxy proxy/

for f in config/{minimal,basic}; do
   tag=$(basename $f)
   docker image build -t guacamole-demo-config:$tag $f
done 
