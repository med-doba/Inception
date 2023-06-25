#!/bin/sh

MailHog
# mailhog -api-bind-addr 0.0.0.0:8025 &

until curl -sSf http://localhost:8025 >/dev/null; do
    echo "Waiting for MailHog to start..."
    sleep 1
done

# curl --request POST \
#      --url http://localhost:1025/api/v2/send \
#      --header 'Content-Type: application/json' \
#      --data '{
#          "to": "mohaeddo03@gmail.com",
#          "from": "mohaeddo18@gmail.com",
#          "subject": "Test Email",
#          "text": "This is a test email sent via MailHog."
#      }'
# curl --request POST \
#      --url http://mailhog:1025/api/v2/send \
#      --header 'Content-Type: application/json' \
#      --data '{
#          "to": "mohaeddo03@gmail.com",
#          "from": "mohaeddo18@gmail.com",
#          "subject": "Test Email",
#          "text": "This is a test email sent via MailHog."
#      }'

#!/bin/bash

# Get the IP address of the MailHog container
mailhog_ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' mailhog)

# Get the name of the WordPress container
wordpress_container=$(docker ps --format '{{.Names}}' | grep 'wordpress')

# Update the WordPress configuration to use MailHog
docker exec -it $wordpress_container wp option update smtp_host "$mailhog_ip"
docker exec -it $wordpress_container wp option update smtp_port 1025
docker exec -it $wordpress_container wp option update smtp_ssl ssl

# Restart the WordPress container for the changes to take effect
docker restart $wordpress_container

# curl --request POST --url http://mailhog:1025/api/v2/send --header 'Content-Type: application/json' --data "{\"to\":\"mohaeddo03@gmail.com\",\"from\":\"mohaeddo18@gmail.com\",\"subject\":\"Test Email\",\"text\":\"This is a test email sent via MailHog.\"}"
curl --request POST --url http://mailhog:1025/api/v2/send --header 'Content-Type: application/json' --data '{"to":"mohaeddo03@gmail.com","from":"mohaeddo18@gmail.com","subject":"Test Email","text":"This is a test email sent via MailHog."}'

exec "$@"