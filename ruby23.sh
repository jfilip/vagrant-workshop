#!/bin/bash -e

sudo apt-get -y update
sudo apt-get -y install ntp sqlite3 ruby ruby-dev bundler
sudo mkdir -p /opt/bundle
sudo chown -R vagrant:staff /opt/bundle
