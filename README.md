# WP Single Tenant

_Version 0.0.1_

A custom composer configuration for a single install of WordPress

## Getting Started

The following guide will walk your through setting up a WordPress singletenant environment for `local dev`, or on a `dev`, `staging` or `production` server.

## Getting Started

The setup takes three quick steps. SSH into your machine and navigate to where you copied the files from this repo.

```
cp ./scripts/setup.sh ./
bash setup.sh
composer update
exit
```

About the setup commands

-   `cp ./scripts/setup.sh ./` - copies the setup script to the install root, and will self-delete once the configuration has been compleded
-   `bash setup.sh` - runs the setup script, and uses the answers provide to build and copy key config files
-   `composer update` - this will install WordPress and other dependencies. The composer.json file that gets copied to the install root can be modified before or after running this
-   `exit` - finishes you ssh session and logs out of the server

## Additional Composer

For all composer commands, you can run either `composer update` or `composer install`. The key difference is that using install will not upgrade any of the dependencies beyond what it store in the `composer.lock` file. The lock file is generate when the update command is used.

Composer offers several options that can be passed while running an update or install. Update offers seven more [Update Options](https://getcomposer.org/doc/03-cli.md#update-u) than what is available in the [Install Options](https://getcomposer.org/doc/03-cli.md#install-i).

There are also a series of [Global Options](https://getcomposer.org/doc/03-cli.md#global-options) that can be used with any command.

### Example: Production Composer Command

This command is intended for a production environment as the `--no-interaction` option will prevent any interactive questions from being asked, while the `--prefer-dist` will install all packages from dist wherever possible.

```
composer update --no-interaction --prefer-dist
```

### Example: Using Multiple Composer Files

If you want to use multiple composer files, see the command below. A benefit of multiple composer files would be to have one for dev, and another for prod. The prod version could then be versioned locked to prevent an unwanted or untested upgrade

```
COMPOSER=composer.prod.json composer update
```
