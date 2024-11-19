
Just another boring docker for PHP-Symfony.

Automatically runs Symfony installation with basic skeleton, you can change within docker-compose configuration the PHP version to use in composer and the Symfony version

It is only for development purposes :P

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
### 3. Delete All (risky!)

```
docker system prune --all --volumes

sudo rm -rf /var/lib/docker
```

// TODO
Aplicar API instalacion
Aplicar sniffers