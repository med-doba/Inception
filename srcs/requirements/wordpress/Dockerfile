FROM debian:buster

RUN apt-get update && apt-get install -y \
	php7.3-fpm \
	php7.3-mysql

RUN sed -i 's|^listen = .*$|listen = 0.0.0.0:9000|' /etc/php/7.3/fpm/pool.d/www.conf

RUN apt-get update && \
	apt-get install -y curl

RUN mkdir -p /run/php

RUN service php7.3-fpm start

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/wp.sh .

CMD ["./wp.sh"]
