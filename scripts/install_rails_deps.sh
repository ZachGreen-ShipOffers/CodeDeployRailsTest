#!/bin/bash

cd /var/app/CodeDeployRailsTest

bundle install --deployment --without development test
bundle exec rake assets:precompile
export SECRET_KEY_BASE=$(bundle exec rake secret)
export RAILS_ENV=production

sudo chown -R ec2-user:ec2_user /var/app/
