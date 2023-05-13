# FROM debian:buster

# RUN apt-get update && \
# 	apt-get install -y nginx openssl && \
# 	rm -rf /var/lib/apt/lists/*

# RUN mkdir /etc/nginx/ssl && \
# 	openssl req -x509 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -days 365 -nodes -subj '/CN=localhost'

# # Create a directory for PHP temporary files
# RUN mkdir /var/www/php

# COPY ./conf/nginx.conf /etc/nginx/sites-available

# RUN rm -rf /etc/nginx/sites-enabled/default

# RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/default

# RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# # Change the ownership and permissions of the /var/www/php directory
# RUN chown -R www-data:www-data /var/www/php && chmod -R 777 /var/www/php

# # COPY ./tools/index.html /usr/share/nginx/html/index.html

# EXPOSE 443

# CMD ["nginx", "-g", "daemon off;"]

FROM debian:buster

RUN apt-get update && \
	apt-get install -y nginx openssl php-fpm && \
	rm -rf /var/lib/apt/lists/*

RUN mkdir /etc/nginx/ssl && \
	openssl req -x509 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -days 365 -nodes -subj '/CN=localhost'

# Create a directory for PHP temporary files
RUN mkdir /var/www/php

COPY ./conf/nginx.conf /etc/nginx/sites-available

RUN rm -rf /etc/nginx/sites-enabled/default

RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/default

# Change the ownership and permissions of the /var/www/php directory
RUN chown -R www-data:www-data /var/www/php && chmod -R 777 /var/www/php

# RUN chmod a+rwx /var/www/html/index.php

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
