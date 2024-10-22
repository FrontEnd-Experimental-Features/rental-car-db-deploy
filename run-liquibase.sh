#!/bin/bash
set -e

echo "Starting run-liquibase.sh script"

# Wait for PostgreSQL to start
for i in {1..30}; do
  if pg_isready -h postgres -U "$POSTGRES_USER" -d "$POSTGRES_DB"; then
    echo "PostgreSQL is ready"
    break
  fi
  echo "Waiting for PostgreSQL to start... (Attempt $i/30)"
  sleep 5
done

if [ $i -eq 30 ]; then
  echo "Timeout waiting for PostgreSQL to start"
  exit 1
fi

echo "PostgreSQL is ready. Running Liquibase..."

# Run Liquibase
$LIQUIBASE_HOME/liquibase \
  --changelog-file=/liquibase/changelog.xml \
  --url="jdbc:postgresql://postgres:5432/$POSTGRES_DB" \
  --username="$POSTGRES_USER" \
  --password="$POSTGRES_PASSWORD" \
  --logLevel=DEBUG \
  update

echo "Liquibase execution completed"
