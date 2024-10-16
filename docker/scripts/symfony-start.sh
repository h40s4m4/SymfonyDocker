#!/bin/sh
set -e

echo "Versión solicitada: ${SYMFONY_VERSION:-última versión estable}"

# Checking if Symfony's project exist
if [ -f "composer.json" ]; then
  echo "There is already a Symfony project. Skip installation."
else
#  echo "Symfony no está instalado. Creando proyecto Symfony..."
#  echo "Versión solicitada: ${SYMFONY_VERSION:-última versión estable}"

  # Crear proyecto Symfony temporalmente en 'tmp'
  composer create-project "symfony/skeleton" tmp --prefer-dist --no-progress --no-interaction --no-install || {
    echo "Error: Download of Symfony Skeleton failed."
    exit 1
  }

  # Move directory
  cd tmp
  cp -Rp . ..
  cd ..
  rm -rf tmp/

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