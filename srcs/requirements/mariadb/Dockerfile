# Use the official Debian Buster as a parent image
FROM debian:buster

# Set the MariaDB version
ENV MARIADB_VERSION=10.5

# Install the required packages
RUN apt-get update && \
    apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

# Copy the custom configuration file to the container
# COPY my.cnf /etc/mysql/conf.d/my.cnf

# Expose the default MySQL port
EXPOSE 3306

# Start the MariaDB service
CMD ["mysqld"]
