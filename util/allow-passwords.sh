#!/bin/bash -e

sed -i.bak 's/PasswordAuthentication no/PasswordAuthentication yes/' \
    /etc/ssh/sshd_config
service sshd restart
