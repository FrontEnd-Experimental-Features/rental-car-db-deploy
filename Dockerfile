# Use an official PostgreSQL image as the base image
FROM postgres:14-alpine

# Install Liquibase
RUN apk add --no-cache openjdk11-jre-headless wget \
    && wget -O /usr/local/bin/liquibase.tar.gz https://github.com/liquibase/liquibase/releases/download/v4.23.0/liquibase-4.23.0.tar.gz \
    && tar -xzf /usr/local/bin/liquibase.tar.gz -C /usr/local/bin \
    && rm /usr/local/bin/liquibase.tar.gz

# Set up environment variables
ENV LIQUIBASE_HOME /usr/local/bin/liquibase

# Copy your Liquibase changelog files
COPY liquibase /liquibase

# Copy a script to run Liquibase after PostgreSQL starts
COPY run-liquibase.sh /docker-entrypoint-initdb.d/

# Make the script executable
RUN chmod +x /docker-entrypoint-initdb.d/run-liquibase.sh
