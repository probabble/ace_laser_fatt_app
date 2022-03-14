docker_user=$(id -u $USER):$(id -g $USER)
export IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
export UID_GID=$docker_user
docker-compose up
