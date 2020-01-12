<?php // @codingStandardsIgnoreLine
/**
 * Global database constants for local env
 *
 * @since WP Multi Tenant
 * @package WordPress Constants
 * @version 1.0
 *
 */
define('DB_USER', getenv('DB_USER'));
define('DB_PASSWORD', getenv('DB_PASSWORD'));
define('DB_HOST', getenv('DB_HOST'));
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

/**
 * Set WordPress Install Directory
 *
 * @since WP Multi Tenant
 * @package WordPress Constants
 * @version 1.0
 */
define('WP_INSTALL_DIR', getenv('ENV_PUBLICPATH') . '/');

/**
 * Set Home and Admin URLs
 *
 * @since WP Multi Tenant
 * @package WordPress Constants
 * @version 1.0
 */
$wp_homeurl = 'https://' . getenv('ENV_CURRENT_DOMAIN');
$wp_siteurl = 'https://' . getenv('ENV_CURRENT_DOMAIN') . '/wp';

define('WP_HOME', $wp_homeurl);
define('WP_SITEURL', $wp_siteurl);

/**
 * Set paths to wp-content and plugins
 *
 * @since WP Multi Tenant
 * @package WordPress Constants
 * @version 1.0
 */
define('WP_CONTENT_DIR', WP_INSTALL_DIR . '/wp-content');
define('WP_CONTENT_URL', WP_HOME . '/wp-content');

define('WP_PLUGIN_DIR', getenv('WP_ASSETS_PATH') . '/plugins');
define('WP_PLUGIN_URL', WP_HOME . '/wp-content/plugins');

define('WPMU_PLUGIN_DIR', getenv('WP_ASSETS_PATH') . '/mu-plugins');
define('WPMU_PLUGIN_URL', WP_HOME . '/wp-content/mu-plugins');

/**
 * Configure Debugging
 *
 * @since WP Multi Tenant
 * @package WordPress Constants
 * @version 1.0
 */
$wp_debug         = false;
$wp_debug_log     = false;
$wp_debug_display = false;

// Enable debugging for dev environments
if ('local' === getenv('ENV_CURRENT_ENV') || 'dev' === getenv('ENV_CURRENT_ENV')) {
    $wp_debug         = true;
    $wp_debug_log     = true;
    $wp_debug_display = true;
}

define('WP_DEBUG', $wp_debug);
define('WP_DEBUG_LOG', $wp_debug_log);
define('WP_DEBUG_DISPLAY', $wp_debug_display);

/**
 * Configure cache settings and keys
 *
 * @since WP Multi Tenant
 * @package WordPress Constants
 * @version 1.0
 */
$wp_cache      = true;
$disable_redis = false;

// Disable cache for dev environments
if ('local' === getenv('ENV_CURRENT_ENV') || 'dev' === getenv('ENV_CURRENT_ENV')) {
    $wp_cache      = false;
    $disable_redis = true;
}

define('WP_CACHE', $wp_cache);
if (! defined('WP_CACHE_KEY_SALT')) {
    $md5_cache_salt_key = md5(getenv('ENV_CURRENT_DOMAIN'));
    define('WP_CACHE_KEY_SALT', $md5_cache_salt_key);
}

define('WP_REDIS_DISABLED', $disable_redis);
define('WP_REDIS_SELECTIVE_FLUSH', true);
define('WP_REDIS_MAXTTL', 300);

/**
 * Configure Security Settings
 *
 * @since WP Multi Tenant
 * @package WordPress Constants
 * @version 1.0
 */
define('FORCE_SSL_ADMIN', true);
define('FORCE_SSL_LOGIN', true);
define('AUTOMATIC_UPDATER_DISABLED', true);
define('DISALLOW_FILE_EDIT', true);

/**
 * Configure Editor Settings
 *
 * @since WP Multi Tenant
 * @package WordPress Constants
 * @version 1.0
 */
define('AUTOSAVE_INTERVAL', 160);
define('WP_POST_REVISIONS', 5);
define('EMPTY_TRASH_DAYS', 7);

/**
 * Set cookie paths
 *
 * @since WP Multi Tenant
 * @package WordPress Constants
 * @version 1.0
 */
define('ADMIN_COOKIE_PATH', '/');
define('COOKIE_DOMAIN', '');
define('COOKIEPATH', '/');
define('SITECOOKIEPATH', '');
