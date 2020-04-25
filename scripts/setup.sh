## Prevent WordPress from editing htaccess files
chmod 444 config/.htaccess-standard
chmod 444 config/.htaccess-multisite

# Create uploads folder on install
mkdir ./wp-content/drop-ins
mkdir ./wp-content/uploads
chmod 777 ./wp-content/uploads

# Build symlinks on install
setup_basepath=`pwd`

ln -s $setup_basepath/app/stable ./wp
ln -s $setup_basepath/config/.htaccess-standard ./.htaccess
ln -s $setup_basepath/config/wp-cli.yml ./wp-cli.yml
ln -s $setup_basepath/config/wp-env.php ./wp-env.php

# Copy setup files
cp ./_setup/composer.json ./composer.json
cp ./_setup/composer.sh ./scripts/composer.sh

# User specified environment
echo -e "\nSet your environment";
PS3='Choose option 1, 2 or 3: '
options=("local" "dev" "prod")
select setup_env in "${options[@]}"
do
    case $setup_env in
        "local")
            break
            ;;
        "dev")
            break
            ;;
        "prod")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
echo -e "\n"

# User specified url
echo "Set your site URL (excluding the https://)"
read setup_url
echo -e "\n"

# User specified database name
echo "Set your database user (eg: homestead)"
read setup_dbuser
echo -e "\n"

# User specified database name
echo "Set your database password"
read setup_dbpass
echo -e "\n"

# User specified database name
echo "Set your database host"
read setup_dbhost
echo -e "\n"

# User specified database name
echo "Set your database name"
read setup_dbname
echo -e "\n"

# User specified database prefix
echo "Set your database prefix, include the underscore (eg: wp_)"
read setup_prefix
echo -e "\n"

# Setup multisite
echo -e "\nDo you want to setup a multisite install?";
PS3='Choose option 1 or 2: '
options=("Yes" "No")
select setup_multisite in "${options[@]}"
do
    case $setup_multisite in
        "true")
            break
            ;;
        "false")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
echo -e "\n"

# Build env variables
cp ./_setup/.env.local ./config/.env.local-tmp
sed \
    -e "s/SET_DBUSER/$setup_dbuser/g" \
    -e "s/SET_DBPASS/$setup_dbpass/g" \
    -e "s/SET_DBHOST/$setup_dbhost/g" \
    -e "s/SET_DBNAME/$setup_dbname/g" \
    -e "s/SET_ENV/$setup_env/g" \
    -e "s/SET_URL/$setup_url/g" \
    -e "s/SET_MULTISITE/$setup_multisite/g" \
    -e "s/SET_BASEPATH/${setup_basepath//\//\\/}/g" \
    ./config/.env.local-tmp > ./config/.env
    rm ./config/.env.local-tmp
echo -e "Environment variables have been set"

# Build site config file
cp ./_setup/site-config.php ./site-config-tmp.php
sed \
    -e "s/SET_PREFIX/$setup_prefix/g" \
    ./site-config-tmp.php > ./site-config.php
    rm ./site-config-tmp.php
echo -e "Site config file has been created"

# Final clean-up
rm setup.sh

echo -e "Site setup completed\n"