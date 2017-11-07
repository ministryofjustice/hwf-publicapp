#! /bin/bash
set -e

APP_HOST=${APP_HOST:-http://localhost:8080/}
while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' $APP_HOST)" != "200" ]]; do
  >&2 echo "Waiting for ZAP to start"
  sleep 2
done

bundle exec cucumber features/zap_security_feature/zap_security.feature
