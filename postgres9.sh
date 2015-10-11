#!/bin/bash -e

sudo apt-get -y install postgresql-9.3 postgresql-client-9.3 postgresql-server-dev-9.3

# Only create the 'vagrant' user role if it doesn't already exist.
if [ `sudo -u postgres psql -t -c "SELECT COUNT('x') FROM pg_roles WHERE rolname = 'vagrant';"` -eq '0' ]; then
  sudo -u postgres psql -c "CREATE ROLE vagrant WITH CREATEDB LOGIN PASSWORD 'vagrant';"
fi
