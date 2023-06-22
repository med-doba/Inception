FROM debian:buster

ENV MYSQL_ROOT_PASSWORD=@root2003

RUN apt-get update && apt-get install -y mariadb-server

RUN sed -i 's|^bind-address            = .*$|bind-address            = 0.0.0.0|' /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/db.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/db.sh

CMD ["/usr/local/bin/db.sh"]
