#!/bin/bash

PHUSION_SERVICE="${PHUSION:-false}"
case ${PHUSION_SERVICE} in
true)
    echo "running as service"
    cd /home/app/
    bundle exec unicorn -p ${UNICORN_PORT:-8080} -c ./config/unicorn.rb -E ${RAILS_ENV:-production}
    ;;
*)
    echo "normal startup"
    bundle exec unicorn -p ${UNICORN_PORT:-8080} -c ./config/unicorn.rb
    ;;
esac
