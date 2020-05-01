#!/bin/bash

PHUSION_SERVICE="${PHUSION:-false}"
case ${PHUSION_SERVICE} in
true)
    echo "running as service"
    cd /home/app/
    bundle exec puma -p ${PUMA_PORT:-8080} -C ./config/puma.rb -E ${RAILS_ENV:-production}
    ;;
*)
    echo "normal startup"
    bundle exec puma -p ${PUMA_PORT:-8080} -C ./config/puma.rb
    ;;
esac
