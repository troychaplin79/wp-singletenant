# WP Single Tenant

_Version 0.0.1_

A custom composer configuration for a single install of WordPress

## Installing a Site

To install a new site, SSH into the root of the file server and run the following command. Information about the available variables can be found below.

```
cp ./scripts/setup.sh ./
bash setup.sh env site install

```

- `env` - use: local, dev, or prod
- `site` - specify the site you wish to setup, use folder names as they appear inside `_sites`
- `install` - add this the first time you are setting up a local envionment for this site

---