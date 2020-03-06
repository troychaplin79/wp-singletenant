# Create uploads folder on install
mkdir ./wp-content/drop-ins
mkdir ./wp-content/uploads
chmod 777 ./wp-content/uploads

# Build symlinks on install
ln -s /app/public/app/stable ./wp
ln -s /app/public/config/.htaccess-standard ./.htaccess
ln -s /app/public/config/wp-cli.yml ./wp-cli.yml
ln -s /app/public/config/wp-env.php ./wp-env.php

# User specified environment
echo -e "\nSet your environment: LOCAL, DEV, STAGING, PROD";
read setup_env
echo -e "\n"

# User specified url
echo "Set your site URL (excluding the https://)"
read setup_url
echo -e "\n"

# User specified database name
echo "Set your database name"
read setup_dbname
echo -e "\n"

# User specified database prefix
echo "Set your database prefix, include the underscore (eg: wp_)"
read setup_prefix
echo -e "\n"

# Build env variables
cp ./_example/.env.local ./config/.env.local-tmp
sed \
    -e "s/SET_ENV/$setup_env/g" \
    -e "s/SET_URL/$setup_url/g" \
    -e "s/SET_DBNAME/$setup_dbname/g" \
    ./config/.env.local-tmp > ./config/.env
    rm ./config/.env.local-tmp
echo -e "Environment variable have been set"

# # Build site config file
cp ./_example/site-config.php ./site-config-tmp.php
sed \
    -e "s/SET_PREFIX/$setup_prefix/g" \
    ./site-config-tmp.php > ./site-config.php
    rm ./site-config-tmp.php
echo -e "Site config file has been created"

# Final clean-up
rm setup.sh

echo -e "Site setup completed\n"