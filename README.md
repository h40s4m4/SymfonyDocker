# Symfony Docker

Just another boring docker for PHP-Symfony

When you start docker, it checks if there is no composer.json file, if not, 
it automatically runs the Symfony installation with a basic skeleton.

Install a TEST DB too




> [!WARNING]  
> It is only for development purposes :P


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


- symfony/orm-pack
  - [Doctrine ORM](https://symfony.com/doc/current/doctrine.html)
- symfony/browser-kit
  - [Use for HTTP Client](https://symfony.com/doc/current/components/browser_kit.html)
- api-platform/core
  - [The API-first framework for Symfony](https://api-platform.com/?s=symfony)
- nesbot/carbon
  - [An API extension for DateTime](https://github.com/briannesbitt/Carbon)
- symfonycasts/micro-mapper
  - [A tiny, underwhelming data mapper to map one object to another](https://github.com/briannesbitt/Carbon)

## Dev Dependencies

### Symfony Base DEV

- symfony/maker-bundle
  - [Basic Tools of Symfony](https://symfony.com/bundles/SymfonyMakerBundle/current/index.html)
- symfony/css-selector
  - [Tool for CSS Selector (functional test) of Symfony](https://symfony.com/doc/current/components/css_selector.html)
  
### Coding Standard

- "doctrine/coding-standard"
- "slevomat/coding-standard"
- "squizlabs/php_codesniffer"

### Testing 

- dama/doctrine-test-bundle
  - [Roll back automatically after the test finishes to undo all changes](https://github.com/dmaicher/doctrine-test-bundle)
- doctrine/doctrine-fixtures-bundle
  - [Create Fixtures to Doctrine](https://symfony.com/bundles/DoctrineFixturesBundle/current/index.html)
- "phpunit/phpunit"
- "symfony/css-selector"
- "symfony/phpunit-bridge"
- "zenstruck/browser"
- zenstruck/foundry
  - [Create Factory to create objets to test](https://symfony.com/bundles/ZenstruckFoundryBundle/current/index.html)
- "mtdowling/jmespath.php"

