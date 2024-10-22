#!/bin/bash
set -e

echo "Starting run-liquibase.sh script"

# Wait for PostgreSQL to start
until pg_isready -h postgres -U "$POSTGRES_USER" -d "$POSTGRES_DB"; do
  echo "Waiting for PostgreSQL to start..."
  sleep 2
done

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
