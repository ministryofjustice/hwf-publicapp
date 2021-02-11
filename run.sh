#!/bin/bash
PHUSION_SERVICE="${PHUSION:-false}"
case ${PHUSION_SERVICE} in
true)
    echo "running as service"
    cd /usr/src/app/
    bundle exec puma -p ${UNICORN_PORT:-8080} -C ./config/puma.rb -e ${RAILS_ENV:-production}
    ;;
*)
    echo "normal startup"
    bundle exec puma -p ${UNICORN_PORT:-8080} -C ./config/puma.rb -e ${RAILS_ENV:-production}
    ;;
esac
