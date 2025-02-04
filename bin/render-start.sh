#!/usr/bin/env bash

# exit on error
set -o errexit

export RAILS_ENV=production
export RACK_ENV=production
bundle exec rails s -e production
