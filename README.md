Wordpres with Nginx Docker image
================================

### Usage:

```
$ docker pull youssefkababe/wordpress-nginx
$ docker run -d -p 80:80 -p 443:443 youssefkababe/wordpress-nginx
```

##### Attach persistent/shared directories

```
$ docker run -d -p 80:80 -p 443:443 -v <wp-content-dir>:/usr/share/nginx/html/wordpress/wp-content <sites-enabled-dir>:/etc/nginx/sites-enabled -v <certs-dir>:/etc/nginx/certs -v <log-dir>:/var/log/nginx youssefkababe/wordpress-nginx
```

### Usage with Docker compose

```yml
blog:
  image: youssefkababe/wordpress-nginx
  ports:
    - "80:80"
    - "443:443"
  volumes:
    - <wp-content-dir>:/usr/share/nginx/html/wordpress/wp-content
    - <sites-enabled-dir>:/etc/nginx/sites-enabled
    - <certs-dir>:/etc/nginx/certs
    - <log-dir>:/var/log/nginx
  links:
    - mysql

mysql:
  image: mysql
  volumes:
    - <mysql-data-dir>:/var/lib/mysql
  expose:
    - "3306"
  environment:
    - MYSQL_ROOT_PASSWORD=123456
    - MYSQL_DATABASE=wordpress
    - MYSQL_USER=admin
    - MYSQL_PASSWORD=123456
```

Then, when setting up your blog, you should type something like this:

![Wordpress setup](http://i.imgur.com/WeqEPJa.png)

Enjoy!
