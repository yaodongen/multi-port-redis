
FROM redis:5.0.7

RUN apt-get update && apt-get install iptables -y

# TO_REDIRECT_PORT,  thid is a fake port, will redirect to REDIS_PORT
# REDIS_PORT,       the real redis port
ENTRYPOINT iptables -t nat -A PREROUTING -p tcp --dport $TO_REDIRECT_PORT -j REDIRECT --to-ports $REDIS_PORT && docker-entrypoint.sh --port $REDIS_PORT