
Just another boring docker for PHP-Symfony

Automatically runs Symfony installation with basic skeleton, you can change within docker-compose configuration the PHP version to use in composer and the Symfony version

Install a TEST DB too

It is only for development purposes :P

## Docker

Build fresh images and start project

```
docker compose build --no-cache 
docker compose up --pull always -d --wait
```

Stop and remove containers.
```
docker compose down --remove-orphans
```

## Dependencies


- "symfony/orm-pack"
  - [Doctrine ORM](https://symfony.com/doc/current/doctrine.html)
- "api-platform/core"
  - [The API-first framework for Symfony](https://api-platform.com/?s=symfony)
- "nesbot/carbon"
  - [An API extension for DateTime](https://github.com/briannesbitt/Carbon)
- "symfonycasts/micro-mapper"
  - [A tiny, underwhelming data mapper to map one object to another](https://github.com/briannesbitt/Carbon)

## Dev Dependencies

### Coding Standard

- "doctrine/coding-standard"
- "slevomat/coding-standard"
- "squizlabs/php_codesniffer"

### Testing 

- "dama/doctrine-test-bundle"
- "doctrine/doctrine-fixtures-bundle"
- "phpunit/phpunit"
- "symfony/browser-kit"
- "symfony/css-selector"
- "symfony/maker-bundle"
- "symfony/phpunit-bridge"
- "zenstruck/browser"
- "zenstruck/foundry"
- "mtdowling/jmespath.php"
