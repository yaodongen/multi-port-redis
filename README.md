# Multi Port Redis
support muliti port redis in docker-compose

# usage
## How to run
### use docker
#### build
`docker build -f dockerfile -t multi-port-redis .`
#### run
`docker run -d --cap-add=NET_ADMIN -e TO_REDIRECT_PORT=7999 -e REDIS_PORT=6379  -p "6379:6379" -p "7999:7999" multi-port-redis`

### use docker-compose
#### build and run
`docker-compose -f docker-compose.yml up -d`

## How to test/verify
#### test REDIS_PORT
` nc -v -w 2 127.0.0.1 6379 ` 
#### test TO_REDIRECT_PORT
` nc -v -w 2 127.0.0.1 7999 `

# FAQ
1. why not set "7999:6379" in "ports" config ?  
Only set "7999:6379" in "ports" config will only work out of docker-compose network. Can't work in docker-compose network