#!/bin/bash

rsync -aq wpc/* wp-content
chown -R www-data:www-data wp-content

if [ -f "wp-config.php" ]
then
  sed  "/require_once(ABSPATH . 'wp-settings.php');/ { N; s/require_once(ABSPATH . 'wp-settings.php');/if ($_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https') $_SERVER['HTTPS']='on';\n&/ }" wp-config.php
fi

service php5-fpm start
nginx
