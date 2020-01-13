# Create uploads folder on install
if [[ $2 ]]; then
    mkdir ./wp-content/uploads
    chmod 777 ./wp-content/uploads
fi
# Copy site config files
cp ./_sites/$1/.env.local ./config/.env
cp ./_sites/$1/composer.sh ./scripts/
cp ./_sites/$1/composer.json .
cp ./_sites/$1/site-config.php .

# Build symlinks on install
if [[ $2 ]]; then
    ln -s /app/public/app/stable ./wp
    ln -s /app/public/config/.htaccess-standard ./.htaccess
    ln -s /app/public/config/wp-cli.yml ./wp-cli.yml
    ln -s /app/public/config/wp-env.php ./wp-env.php
fi

# Final clean-up
rm update.sh

echo -e "Site is done, exit ssh and run composer update to finish installation\n"