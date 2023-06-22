#!/bin/sh

grep -qF "maxmemory 256mb" "/etc/redis/redis.conf"
if [ $? -ne 0 ]; then
    echo "maxmemory 256mb" >> /etc/redis/redis.conf
fi

grep -qF "maxmemory-policy allkeys-lru" "/etc/redis/redis.conf"
if [ $? -ne 0 ]; then
    echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf
fi

sed -i 's|^bind .*$|bind 0.0.0.0|' /etc/redis/redis.conf

redis-server --protected-mode no