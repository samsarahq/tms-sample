#!/usr/bin/env bash

# exit on error
set -o errexit

echo "Setting up karafka"
export RAILS_ENV=production
export RACK_ENV=production
bundle exec karafka server