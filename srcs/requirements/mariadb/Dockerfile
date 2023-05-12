# Use the official Debian Buster as a parent image
FROM debian:buster

# Set the MariaDB version
ENV MARIADB_VERSION=10.5

ENV MYSQL_ROOT_PASSWORD=@root2003

# Install the required packages
RUN apt-get update && apt-get install -y mariadb-server mariadb-client

RUN sed -i 's|^bind-address            = .*$|bind-address            = 0.0.0.0|' /etc/mysql/mariadb.conf.d/50-server.cnf

RUN sed -i 's/^skip-networking/#&/' /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/db.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/db.sh

# ENTRYPOINT ["/usr/local/bin/db.sh"]

# Expose the default MySQL port

# Start the MariaDB service
# CMD ["mysqld"]
CMD ["/usr/local/bin/db.sh"]
