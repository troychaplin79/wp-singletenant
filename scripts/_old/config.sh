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

# Setup files and folders
# mkdir ./wp-content/uploads
# chmod 777 ./wp-content/uploads

# Setup env variables
cp ./_example/.env.local ./config/.env.local-tmp
sed \
    -e "s/SET_ENV/$1/g" \
    -e "s/SET_URL/$2/g" \
    ./config/.env.local-tmp > ./config/.env
    rm ./config/.env.local-tmp
echo -e "Environment variable have been set"

# Copy site config file
cp ./_example/site-config.php ./site-config-tmp.php
sed \
    -e "s/SET_DBNAME/$3/g" \
    -e "s/SET_PREFIX/$4_/g" \
    ./site-config-tmp.php > ./site-config.php
    rm ./site-config-tmp.php
echo -e "Site config file has been created"

# Build symlinks
ln -s $PUBLIC_PATH/app/stable ./wp
ln -s $PUBLIC_PATH/config/.htaccess-standard ./.htaccess
ln -s $PUBLIC_PATH/config/wp-cli.yml ./wp-cli.yml
ln -s $PUBLIC_PATH/config/wp-env.php ./wp-env.php
echo -e "Symlinks have been added"\

# Final clean-up
rm install.sh

echo -e "Site is done, exit ssh and run composer update to finish installation\n"