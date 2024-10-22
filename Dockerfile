# Use an official PostgreSQL image as the base image
FROM postgres:14-alpine

# Install Liquibase and its dependencies
RUN apk add --no-cache openjdk11-jre-headless wget \
    && wget -O /tmp/liquibase.tar.gz https://github.com/liquibase/liquibase/releases/download/v4.23.0/liquibase-4.23.0.tar.gz \
    && mkdir -p /usr/local/liquibase \
    && tar -xzf /tmp/liquibase.tar.gz -C /usr/local/liquibase \
    && rm /tmp/liquibase.tar.gz

# Set up environment variables
ENV LIQUIBASE_HOME /usr/local/liquibase
ENV PATH $PATH:/usr/local/liquibase

# Copy your Liquibase changelog files
COPY liquibase /liquibase

# Copy a script to run Liquibase after PostgreSQL starts
COPY run-liquibase.sh /docker-entrypoint-initdb.d/

# Make the script executable
RUN chmod +x /docker-entrypoint-initdb.d/run-liquibase.sh
