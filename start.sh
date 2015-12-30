#!/bin/bash

rsync -aq wpc/* wp-content
chown -R www-data:www-data wp-content

sed --in-place "/if ($_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https') $_SERVER['HTTPS']='on';\n/d" wp-config.php
sed  "/require_once(ABSPATH . 'wp-settings.php');/ { N; s/require_once(ABSPATH . 'wp-settings.php');/if ($_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https') $_SERVER['HTTPS']='on';\n&/ }" wp-config.php

service php5-fpm start
nginx
