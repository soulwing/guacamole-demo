#!/bin/bash -e

# create user account and home directory
NAME=bob
SSH_DIR=/home/$NAME/.ssh
useradd -p '$6$BDePNYw6$Mb8gY5aFIrWbIUISU0jwlDE6VxDi0GJevMxVQrq2lgnYNaM1eE0ACO97LpqB7C9lQe0xcmY8zmhfo0sVfNeaw1' -m -s /bin/bash $NAME

mkdir -p $SSH_DIR
ssh-keygen -q -t rsa -b 2048 -f $SSH_DIR/id_rsa
cp $SSH_DIR/id_rsa.pub $SSH_DIR/authorized_keys
chown -R $NAME:$NAME $SSH_DIR
chmod -R go-rwx $SSH_DIR
