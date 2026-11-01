#!/usr/bin/env bash
# Nạp sample data vào container MySQL đang chạy (docker compose up -d trước).
# Chạy từ thư mục gốc repo:  bash database/seed.sh
set -euo pipefail
cd "$(dirname "$0")/.."
set -a; source .env; set +a

for f in database/sample_data/*.sql; do
  echo ">> Loading $f"
  docker compose exec -T db mysql -uroot -p"$MYSQL_ROOT_PASSWORD" --default-character-set=utf8mb4 "$MYSQL_DATABASE" < "$f"
done
echo "Done."
