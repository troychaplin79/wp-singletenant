# WP Single Tenant

_Version 0.0.1_

A custom composer configuration for a single install of WordPress

## Getting Started

The following guide will walk your through setting up a WordPress singletenant environment using Local by Flywheel, but these instructions can be easily changed and adapted to function on just about any other local development setup, or a dev, staging or production server.

## Initial Setup

The setup takes two quick steps.

### Step One: Setup Script

In the first step you will copy and run a script that will prompt you for specific information about this setup. To run the setup script you need to **SHH into** you Flywheel site and run the 3 commands below.

```
cd app/public
cp ./scripts/setup.sh ./
bash setup.sh
exit
```

### Step Two: Composer

The second step will download WordPress and a few plugins via composer. You can customize what will be installed, edit the `composer.json` file that sits at the base of this repo. To run composer, open a terminal window, navigate to where this repo lives on your machine, then run:

```
composer update
```

### Bonus Section: About Composer

For all composer commands, you can run either `composer update` or `composer install`. The key difference is that using install will not upgrade any of the dependencies beyond what it store in the `composer.lock` file. The lock file is generate when the update command is used.

Composer offers several options that can be passed while running an update or install. Update offers seven more [Update Options](https://getcomposer.org/doc/03-cli.md#update-u) than what is available in the [Install Options](https://getcomposer.org/doc/03-cli.md#install-i).

There are also a series of [Global Options](https://getcomposer.org/doc/03-cli.md#global-options) that can be used with any command.

#### Example: Production Composer Command

This command is intended for a production environment as the `--no-interaction` option will prevent any interactive questions from being asked, while the `--prefer-dist` will install all packages from dist wherever possible.

```
composer update --no-interaction --prefer-dist
```

#### Example: Using Multiple Composer Files

If you want to use multiple composer files, see the command below. A benefit of multiple composer files would be to have one for dev, and another for prod. The prod version could then be versioned locked to prevent an unwanted or untested upgrade

```
COMPOSER=composer.prod.json composer update
```
