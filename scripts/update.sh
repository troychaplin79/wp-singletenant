# Check for env
if [[ ! $1 ]]; then
    echo "Specify environment to continue (local, dev, prod)";
    exit 1;
elif [ "local" = $1 ]; then
  PUBLIC_PATH=/app/public
elif [ "dev" = $1 ]; then
  PUBLIC_PATH=/path-to-server
elif [ "prod" = $1 ]; then
  PUBLIC_PATH=/path-to-server
fi

# Create uploads folder on install
if [[ $3 ]]; then
  mkdir ./wp-content/uploads
  chmod 777 ./wp-content/uploads
fi

# Copy site config files
cp ./_sites/$2/.env.$1 ./config/.env
cp ./_sites/$2/composer.sh ./scripts/
cp ./_sites/$2/composer.json .
cp ./_sites/$2/site-config.php .

# Build symlinks on install
if [ $3 ]; then
  ln -s $PUBLIC_PATH/app/stable ./wp
  ln -s $PUBLIC_PATH/config/.htaccess-standard ./.htaccess
  ln -s $PUBLIC_PATH/config/wp-cli.yml ./wp-cli.yml
  ln -s $PUBLIC_PATH/config/wp-env.php ./wp-env.php
fi

# Final clean-up
rm setup.sh

echo -e "Site is done, exit ssh and run composer update to finish installation\n"