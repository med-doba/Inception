#!/bin/sh

# Start MailHog
MailHog &

# Wait for MailHog to start
while ! curl -sSf http://localhost:8025/ >/dev/null; do
    echo "Waiting for MailHog to start..."
    sleep 1
done

# Send an email using curl command
curl --request POST \
     --url http://localhost:8025/ \
     --header 'Content-Type: application/json' \
     --data '{
       "To": ["mohaeddo03@gmail.com"],
       "From": "mohaeddo03@gmail.com",
       "Subject": "Test Email",
       "Text": "This is a test email."
     }'

# Run a long-running process to keep the container running
while true; do
    sleep 3600
done
