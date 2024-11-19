#!/bin/bash
set -e

dependencies=(
  "symfony/orm-pack"
  "api-platform/core"
  "nesbot/carbon"
  "symfonycasts/micro-mapper"
)

dev_dependencies=(
  "dama/doctrine-test-bundle"
  "doctrine/coding-standard"
  "doctrine/doctrine-fixtures-bundle"
  "phpunit/phpunit"
  "slevomat/coding-standard"
  "squizlabs/php_codesniffer"
  "symfony/browser-kit"
  "symfony/css-selector"
  "symfony/maker-bundle"
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

  # Move directory contents to the current directory
  mv tmp/* tmp/.* . 2>/dev/null || true
  rm -rf tmp/

  # Define Configs.
  composer config --json extra.symfony.docker 'false'

  # Add Required packages.
  composer require --no-update "php:>=${PHP_VERSION}"
  composer require --no-update "${dependencies[@]}"
  composer require --dev --no-update "${dev_dependencies[@]}"
fi

# If the vendor folder is empty, install the packages
if [ ! -d "vendor" ] || [ -z "$(ls -A 'vendor/' 2>/dev/null)" ]; then

  composer update --dev --prefer-dist --no-progress --no-interaction & install_pid=$!

  if wait $install_pid; then
    echo "Dependencies installed successfully."
  else
    echo "Error: Dependencies installation failed."
  exit 1
  fi

fi