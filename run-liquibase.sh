#!/bin/bash
set -e

# Wait for PostgreSQL to start
until pg_isready -U "$POSTGRES_USER" -d "$POSTGRES_DB"; do
  echo "Waiting for PostgreSQL to start..."
  sleep 2
done

# Run Liquibase
$LIQUIBASE_HOME/liquibase \
  --changelog-file=/liquibase/changelog.xml \
  --url="jdbc:postgresql://localhost:5432/$POSTGRES_DB" \
  --username="$POSTGRES_USER" \
  --password="$POSTGRES_PASSWORD" \
  update
