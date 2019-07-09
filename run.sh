#!/bin/bash

cd /home/app/
bundle exec unicorn -p ${UNICORN_PORT:-8080} -c ./config/unicorn.rb -E ${RAILS_ENV:-production}
