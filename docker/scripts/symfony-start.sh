#!/bin/bash
set -e

dependencies=(
  "symfony/asset"
  "symfony/orm-pack"
  "symfony/browser-kit"
  "symfony/security-bundle"
  "symfony/serializer"
  "symfony/twig-bundle"
  "symfony/validator"
  "symfony/property-access"
  "symfony/property-info"
  "symfony/expression-language"
  "api-platform/doctrine-orm"
  "api-platform/symfony"
  "nesbot/carbon"
  "symfonycasts/micro-mapper"
  "nelmio/cors-bundle"
  "phpdocumentor/reflection-docblock"
  "phpstan/phpdoc-parser"
)

basic_dev_dependencies=(
  "symfony/maker-bundle"
  "symfony/css-selector"
)

coding_standar_dependencies=(
  "doctrine/coding-standard"
  "slevomat/coding-standard"
  "squizlabs/php_codesniffer"
)

test_dependencies=(
  "dama/doctrine-test-bundle"
  "doctrine/doctrine-fixtures-bundle"
  "phpunit/phpunit"
  "symfony/phpunit-bridge"
  "zenstruck/browser"
  "zenstruck/foundry"
  "mtdowling/jmespath.php"
)


echo "Using Symfony Version: ${SYMFONY_VERSION}"
echo "Using PHP Version: ${PHP_VERSION}"

if [ ! -f composer.json ]; then

  echo "A composer.json does not exist, creating Symfony application"
  composer create-project "symfony/skeleton ${SYMFONY_VERSION}" tmp --prefer-dist --no-progress --no-interaction --no-install || {
   echo "Error: Download of Symfony Skeleton failed."
   exit 1
  }

  # Move directory contents to the current directory.
  mv tmp/* tmp/.* . 2>/dev/null || true
  rm -rf tmp/

  # Basic Skeleton Install.
  composer config --json extra.symfony.docker 'false'
  composer require "php:>=$PHP_VERSION"
  composer update --prefer-dist --no-progress --no-interaction

  # Required Dependencies install.
  composer require --prefer-dist --no-progress --no-interaction --no-install "${dependencies[@]}"
  composer update --no-progress --no-interaction

  # Add and install basic dev dependencies.
  composer require --dev --prefer-dist --no-progress --no-interaction --no-install "${basic_dev_dependencies[@]}"
  composer update --no-progress --no-interaction

  #Add and install test dependencies.
  composer require --dev --prefer-dist --no-progress --no-interaction --no-install "${test_dependencies[@]}"
  composer update --no-progress --no-interaction

#  composer require --dev --no-update "${basic_dev_dependencies[@]}"
#  composer require --dev --no-update "${test_dependencies[@]}"
##  composer require --dev --no-update "${coding_standar_dependencies[@]}"
#  composer install --prefer-dist --no-progress --no-interaction

#  composer update --no-progress --no-interaction

fi

#echo "Uasdfasdfasfd"
#
#
#  composer require --no-update "${dependencies[@]}"
#  composer require --dev --no-update "${basic_dev_dependencies[@]}"
#
#  composer update --no-progress --no-interaction


#if [ -z "$(ls -A 'vendor/' 2>/dev/null)" ]; then
#
#
#fi

## If the vendor folder is empty, install the packages
#if [ ! -d "vendor" ] || [ -z "$(ls -A 'vendor/' 2>/dev/null)" ]; then
#
#  composer update --dev --prefer-dist --no-progress --no-interaction & install_pid=$!
#
#  if wait $install_pid; then
#    echo "Dependencies installed successfully."
#  else
#    echo "Error: Dependencies installation failed."
#  exit 1
#  fi
#
#fi