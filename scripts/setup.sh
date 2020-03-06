# Create uploads folder on install
mkdir ./wp-content/drop-ins
mkdir ./wp-content/uploads
chmod 777 ./wp-content/uploads

# Build symlinks on install
ln -s /app/public/app/stable ./wp
ln -s /app/public/config/.htaccess-standard ./.htaccess
ln -s /app/public/config/wp-cli.yml ./wp-cli.yml
ln -s /app/public/config/wp-env.php ./wp-env.php

# Final clean-up
rm setup.sh

echo -e "Site setup completed\n"







# Setup env variables
# cp ./_example/.env.local ./config/.env.local-tmp
# sed \
#     -e "s/SET_ENV/$1/g" \
#     -e "s/SET_URL/$2/g" \
#     ./config/.env.local-tmp > ./config/.env
#     rm ./config/.env.local-tmp
# echo -e "Environment variable have been set"

# # Copy site config file
# cp ./_example/site-config.php ./site-config-tmp.php
# sed \
#     -e "s/SET_DBNAME/$3/g" \
#     -e "s/SET_PREFIX/$4_/g" \
#     ./site-config-tmp.php > ./site-config.php
#     rm ./site-config-tmp.php
# echo -e "Site config file has been created"

# # Build symlinks
# ln -s /app/public/app/stable ./wp
# ln -s /app/public/config/.htaccess-standard ./.htaccess
# ln -s /app/public/config/wp-cli.yml ./wp-cli.yml
# ln -s /app/public/config/wp-env.php ./wp-env.php
# echo -e "Symlinks have been added"\

# # Final clean-up
# rm install.sh

# echo -e "Site is done, exit ssh and run composer update to finish installation\n"