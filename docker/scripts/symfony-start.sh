#!/bin/sh
set -e

echo "Using Symfony Version: ${SYMFONY_VERSION}"
echo "Using PHP Version: ${PHP_VERSION}"

# Checking if Symfony's project exist
if [ -f "composer.json" ]; then
  echo "There is already a Symfony project. Skip installation."
else

  # Create temporary in tmp file
  composer create-project "symfony/skeleton ${SYMFONY_VERSION}" tmp --prefer-dist --no-progress --no-interaction --no-install || {
    echo "Error: Download of Symfony Skeleton failed."
    exit 1
  }

  # Move directory
  cd tmp
  cp -Rp . ..
  cd ..
  rm -rf tmp/

  #Add extras to composer.json
  composer require "php:>=${PHP_VERSION}"
	composer config --json extra.symfony.docker 'true'

  echo "Symfony's skeleton correctly installed."
fi

# Check and install dependencies
if [ ! -d "vendor" ] || [ -z "$(ls -A vendor 2>/dev/null)" ]; then
  echo "Installing composer dependencies..."
  composer install --prefer-dist --no-progress --no-interaction || {
    echo "Error: Dependency installation failed."
    exit 1
  }
  echo "Dependencies installed successfully."
else
  echo "Dependencies already installed."
fi