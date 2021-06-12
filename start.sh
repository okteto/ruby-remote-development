#!/bin/sh

# remove once okteto supports the `depends_on` field
bundle exec rake db:migrate
ruby app.rb