## Create Docker

Build fresh images and start project

```
docker compose build --no-cache 
docker compose up --pull always -d --wait
```

Stop and remove containers.
```
docker compose down --remove-orphans
```

## Delete all on Docker (Only for Dev)

### 1. Stop and delete all containers (if exists)

```
docker ps -q | xargs -r docker stop
docker ps -aq | xargs -r docker rm
```

### 2. Delete all images, volumes and networks (if exists)

```
docker images -q | xargs -r docker rmi -f
docker volume ls -q | xargs -r docker volume rm
docker network ls -q | xargs -r docker network rm
```

### 3. Clean unused data

```
docker system prune -a --volumes
```

### 3. Delete All (risky!)

```
 docker system prune --all --volumes

sudo rm -rf /var/lib/docker
```