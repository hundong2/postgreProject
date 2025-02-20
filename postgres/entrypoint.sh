#!/bin/bash

# 백업 루프를 백그라운드에서 실행
backup_loop() {
  while true; do
    pg_dump -U "${POSTGRES_USER}" "${POSTGRES_DB}" > /backups/backup_$(date +%Y%m%d_%H%M%S).sql
    sleep 3600  # 1시간마다 백업
  done
}

backup_loop &

# 원래의 entrypoint 실행
exec /docker-entrypoint.sh "$@"
