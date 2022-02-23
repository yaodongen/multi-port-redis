
FROM redis:5.0.12

RUN apt-get update && apt-get install iptables -y

# TO_REDIRECT_PORT,  fake port, will redirect to REDIS_PORT
# REDIS_PORT,       the real redis port
ENTRYPOINT iptables-legacy -t nat -A PREROUTING -p tcp --dport $TO_REDIRECT_PORT -j REDIRECT --to-ports $REDIS_PORT && docker-entrypoint.sh --port $REDIS_PORT
