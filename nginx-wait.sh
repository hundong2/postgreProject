#!/bin/bash

# postgrest와 grafana가 준비될 때까지 대기
until ping -c 1 postgrest >/dev/null 2>&1; do
  echo "Waiting for postgrest..."
  sleep 2
done

until ping -c 1 grafana >/dev/null 2>&1; do
  echo "Waiting for grafana..."
  sleep 2
done

# NGINX 실행
exec nginx -g 'daemon off;'
