# WP Single Tenant

_Version 0.0.1_

A custom composer configuration for a single install of WordPress

## Install/Update a Site

To install or update a site using previously create config files, SSH into the root of the file server and run the following command. Information about the available variables can be found below.

```
cp ./scripts/update.sh ./
bash update.sh site install

```

-   `site` - specify the site you wish to setup, use folder names as they appear inside `_sites`
-   `install` - _optional:_ add this the first time you are setting up a local envionment for this site to create uploads folder and required symlinks

---
