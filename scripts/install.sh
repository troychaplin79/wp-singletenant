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
mkdir ./wp-content/uploads
cp ./_install-files/bedrock-autoloader.php ./wp-content/mu-plugins
echo -e "File and folder structure has been setup"

# Setup env variables
cp ./_install-files/env.txt ./config/env-tmp.txt
sed \
    -e "s/SET_ENV/$1/g" \
    -e "s/SET_URL/$2/g" \
    ./config/env-tmp.txt > ./config/.env
    rm ./config/env-tmp.txt
echo -e "Environment variable have been set"

# Copy site config file
cp ./_install-files/site-config.php ./site-config-tmp.php
sed \
    -e "s/database_name/$3/g" \
    ./site-config-tmp.php > ./site-config.php
    rm ./site-config-tmp.php
echo -e "Site config file has been created"

# Build symlinks
ln -s $PUBLIC_PATH/app/stable ./wp
ln -s $PUBLIC_PATH/config/.htaccess-standard ./.htaccess
ln -s $PUBLIC_PATH/config/wp-cli.yml ./wp-cli.yml
ln -s $PUBLIC_PATH/config/wp-env.php ./wp-env.php
echo -e "Symlinks have been added"

# WP-CLI commands
wp db create --allow-root
echo -e "Database has been created"

# Final clean-up
rm install.sh
echo -e "Final clean-up is complete"

echo -e "\e[92m\e[1mSite installation has successfully complete\n"