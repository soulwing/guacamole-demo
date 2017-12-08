#!/bin/bash -e

DROP_DIR=$HOME/drop
DEMO_HOME=$HOME/guacamole-demo
CAS_CONFIG=$DEMO_HOME/config/cas-mysql

mkdir -p $CAS_CONFIG/extensions
cp $DROP_DIR/guacamole-auth-cas-0.9.13-incubating.jar $CAS_CONFIG/extensions/
