#!/bin/sh
set -e

echo "Symfony no está instalado. Instalando Symfony..."
echo "$SYMFONY_VERSION"

composer create-project "symfony/skeleton" tmp --prefer-dist --no-progress --no-interaction --no-install

cd tmp
cp -Rp . ..
cd ..
rm -Rf tmp/

# Install Symfony
if [ -z "$(ls -A 'vendor/' 2>/dev/null)" ]; then
  composer install --prefer-dist --no-progress --no-interaction
fi