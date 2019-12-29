# WP Single Tenant

_Version 0.0.1_

A custom composer configuration for a single install of WordPress

## Installing a Site

To install a new site, SSH into the root of the file server and run the following command. Information about the available variables can be found below.

```
cp ./scripts/install.sh ./
bash install.sh env url database tableprefix

cp ./scripts/install.sh ./ ; bash install.sh local v2.idocs.ca idc_v2 idc
```

- `env` - use: local, dev, or prod
- `url` - url without using `https://`
- `database` - set the database name
- `tableprefix` - set db table prefix

---