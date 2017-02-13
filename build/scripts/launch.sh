docker rm $(docker ps -a -q) || true
docker rmi $(docker images -q -f dangling=true) || true
docker kill $(docker ps -q) || true
docker-compose build 
docker-compose up -d
