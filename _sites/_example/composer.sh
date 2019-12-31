## Prevent WordPress from editing htaccess files
chmod 444 config/.htaccess-standard
chmod 444 config/.htaccess-multisite

## Create drop-ins folder
mkdir -p wp-content/drop-ins

## Redis Object Cache
cp wp-content/mu-plugins/redis-cache/includes/object-cache.php wp-content/drop-ins

## Redis Page Cache
cp wp-content/mu-plugins/pj-page-cache-red/advanced-cache.php wp-content/drop-ins