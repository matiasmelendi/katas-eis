#!/usr/bin/env sh
sudo: required
set -e
bundle install
cd char_counter
bundle exec rake