FROM debian:buster

RUN apt-get update && \
	apt-get install -y nginx openssl && \
	rm -rf /var/lib/apt/lists/*

RUN mkdir /etc/nginx/ssl && \
	openssl req -x509 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -days 365 -nodes -subj '/CN=localhost'

COPY ./conf/nginx.conf /etc/nginx/conf.d/

# COPY ./tools/index.html /usr/share/nginx/html/index.html

# RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# Create a directory for PHP temporary files
RUN mkdir -p /var/www/html

# EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]