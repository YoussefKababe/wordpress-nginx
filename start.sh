#!/bin/bash

rsync -aq wpc/* wp-content
chown -R www-data:www-data wp-content
service php5-fpm start
nginx
