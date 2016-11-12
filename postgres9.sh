#!/bin/bash -e

sudo locale-gen en_US.UTF-8

sudo cat - > /etc/default/locale <<EOF
 LANG=en_US.UTF-8
 LANGUAGE=
 LC_CTYPE="en_US.UTF-8"
 LC_NUMERIC="en_US.UTF-8"
 LC_TIME="en_US.UTF-8"
 LC_COLLATE="en_US.UTF-8"
 LC_MONETARY="en_US.UTF-8"
 LC_MESSAGES="en_US.UTF-8"
 LC_PAPER="en_US.UTF-8"
 LC_NAME="en_US.UTF-8"
 LC_ADDRESS="en_US.UTF-8"
 LC_TELEPHONE="en_US.UTF-8"
 LC_MEASUREMENT="en_US.UTF-8"
 LC_IDENTIFICATION="en_US.UTF-8"
 LC_ALL=en_US.UTF-8
EOF

sudo apt-get -y install postgresql-9.5 postgresql-client-9.5 postgresql-server-dev-9.5

# Only create the 'vagrant' user role if it doesn't already exist.
if [ `sudo -u postgres psql -t -c "SELECT COUNT('x') FROM pg_roles WHERE rolname = 'vagrant';"` -eq '0' ]; then
  sudo -u postgres psql -c "CREATE ROLE vagrant WITH CREATEDB LOGIN PASSWORD 'vagrant';"
fi
