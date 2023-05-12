FROM debian:buster

RUN apt-get update && \
	apt-get install -y nginx openssl && \
	rm -rf /var/lib/apt/lists/*

RUN mkdir /etc/nginx/ssl && \
	openssl req -x509 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -days 365 -nodes -subj '/CN=localhost'

COPY ./conf/nginx.conf /etc/nginx/sites-available

RUN rm -rf /etc/nginx/sites-enabled/default

RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/default

# COPY ./tools/index.html /usr/share/nginx/html/index.html

# RUN ls -la /etc/nginx/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]