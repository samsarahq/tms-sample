#!/usr/bin/env bash

# exit on error
set -o errexit

echo "Setting up sidekiq in production mode"
export RAILS_ENV=production
export RACK_ENV=production
bundle exec sidekiq -e production