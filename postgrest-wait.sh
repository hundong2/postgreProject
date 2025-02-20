#!/bin/bash

# PostgreSQL이 준비될 때까지 대기
until pg_isready -h postgres -p 5432 -U postgrest; do
  echo "Waiting for PostgreSQL to be ready..."
  sleep 2
done

# PostgREST 실행
exec /usr/local/bin/postgrest
