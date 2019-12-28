# # Check for defined environment
# if [[ ! $1 ]]; then
#     echo "--------------------------------------------------------------------"
#     echo "You must specify your environment to continue (local, dev, prod)";
#     echo "--------------------------------------------------------------------"
#     exit 1;
# elif [ "local" = $1 ]; then
#   PUBLIC_PATH=/app/public
# elif [ "dev" = $1 ]; then
#   PUBLIC_PATH=/app/public
# elif [ "prod" = $1 ]; then
#   PUBLIC_PATH=/app/public
# fi

# Make site directory
mkdir ./wp-content
mkdir ./wp-content/uploads

echo -e "Directories for wp-content and uploads have been created"

# Copy install files
cp ./_install-files/site-config.php ./site-config-tmp.php

# Modifying site-config
sed \
    -e "s/database_name/$2/g" \
    ./site-config-tmp.php > ./site-config.php
    rm ./site-config-tmp.php

echo -e "Site configuration file have been created"

# Create symlinks
# ln -s $PUBLIC_PATH/config/wp-cli.yml ./wp-cli.yml
# ln -s $PUBLIC_PATH/config/.htaccess-standard ./.htaccess
# ln -s $PUBLIC_PATH/app/stable ./wp
# ln -s $PUBLIC_PATH/assets/mu-plugins ./wp-content/mu-plugins
# ln -s $PUBLIC_PATH/assets/plugins ./wp-content/plugins
# ln -s $PUBLIC_PATH/assets/themes ./wp-content/themes
# ln -s $PUBLIC_PATH/config/db-config.php ./db-config.php
# ln -s $PUBLIC_PATH/config/wp-env.php ./wp-env.php
# ln -s $PUBLIC_PATH/drop-ins/advanced-cache.php ./wp-content/advanced-cache.php
# ln -s $PUBLIC_PATH/drop-ins/db.php ./wp-content/db.php
# ln -s $PUBLIC_PATH/drop-ins/db-error.php ./wp-content/db-error.php
# ln -s $PUBLIC_PATH/drop-ins/object-cache.php ./wp-content/object-cache.php

echo -e "\n--------------------------------------------------------------------\n"
echo -e "Symlinks have been created"

# Create database
wp db create --allow-root

echo -e "\n--------------------------------------------------------------------\n"
echo -e "Database has been created"

rm install.sh

echo -e "\n--------------------------------------------------------------------\n"
echo -e "\e[92m\e[1mSite installation has successfully complete\n"
echo -e "\e[0m--------------------------------------------------------------------\n"