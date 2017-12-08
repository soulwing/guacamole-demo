#!/bin/bash -e

DEMO_DROP=$HOME/drop
DEMO_HOME=$HOME/guacamole-demo
CERT_DIR=$DEMO_HOME/cert

mkdir -p $CERT_DIR

cd $DEMO_DROP
tar -zxpf guacamole.soulwing.org.tar.gz

cp guacamole.soulwing.org/fullchain1.pem $CERT_DIR/cert.pem
cp guacamole.soulwing.org/privkey1.pem $CERT_DIR/key.pem
