#!/bin/bash
set -e

echo "Starting run-liquibase.sh script"

# Wait for PostgreSQL to start
until pg_isready -U "$POSTGRES_USER" -d "$POSTGRES_DB"; do
  echo "Waiting for PostgreSQL to start..."
  sleep 2
done

echo "PostgreSQL is ready. Running Liquibase..."

# Run Liquibase
liquibase \
  --changelog-file=/liquibase/changelog.xml \
  --url="jdbc:postgresql://localhost:5432/$POSTGRES_DB" \
  --username="$POSTGRES_USER" \
  --password="$POSTGRES_PASSWORD" \
  --logLevel=DEBUG \
  update

echo "Liquibase execution completed"
