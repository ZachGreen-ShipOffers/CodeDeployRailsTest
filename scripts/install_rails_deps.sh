#!/bin/bash


git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile

source ~/.bash_profile

rbenv install 2.3.0

gem install bundler

cd /var/app/CodeDeployRailsTest

bundle install --deployment --without development test
bundle exec rake assets:precompile
export SECRET_KEY_BASE=$(bundle exec rake secret)
export RAILS_ENV=production

sudo chown -R ec2-user:ec2_user /var/app/
