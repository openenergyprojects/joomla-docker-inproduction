Save the below code as docker-compose-joomla.yml
```
joomla:
  image: joomla
  links:
    - joomladb:mysql
  ports:
    - 10080:80
  volumes:
    -  /srv/docker/smartprojects/joomla_www:/var/www/html
  environment:
    JOOMLA_DB_PASSWORD: "CHANGE$This!"
  restart: always

joomladb:
  image: mysql:5.6
  environment:
    MYSQL_ROOT_PASSWORD: "CHANGE$This!"
  volumes:
    - /srv/docker/smartprojects/mysql:/var/lib/mysql
  ports: #This is exposed in case you want to login to the mysql from the docker host. It is not mandatory to expose it.
    - 10306:3306
  restart: always

# The below phpmyadmin is optional. Remove it if you do not require it.
# Never expose phpmyadmin to the internet!
phpmyadmin: 
    image: phpmyadmin/phpmyadmin
    environment:
     - PMA_ARBITRARY=1
    restart: always
    ports:
     - 10081:80
    volumes:
     - /srv/docker/smartprojects/phpmyadmin/sessions:/sessions
    links:
     - joomladb:mysql
```
## Preparations before run:
1. Create the static folders, where your data will be saved:
``` mkdir -p /srv/docker/smartprojects/mysql ```
``` mkdir -p /srv/docker/smartprojects/joomla_www```
``` mkdir -p /srv/docker/smartprojects/phpmyadmin/sessions```

2. Note that phpmyadmin container is only for your convenience, can be removed.
3. Similarly, mysql's port exposed to 10306 to the host is just in case one wants to connect to mysql directly from the host.

## How to use it:
To login to the joomla, url is: http://yourdockerhost:10080/
To login to the phpmyadmin, url is: http://yourdockerhost:10081/
To login to phpmyadmin, use: Server:mysql Username:root Password:CHANGE$This!

## How to use docker-compose:
to start:  docker-compose -f docker-compose-joomla.yml up &
to stop:   docker-compose -f docker-compose-joomla.yml stop
to rm:     docker-compose -f docker-compose-joomla.yml rm -f
On rm, you will not lose data, as it's kept outside, under /srv/docker/smartprojects. This is the only thing you need to backup, save, etc.

## Next steps:
To expose it to the internet, you will want to put an nginx/haproxy in front. I recommend: bringnow/haproxy-letsencrypt:latest

## This tutorial and yml files:    
https://github.com/openenergyprojects/joomla-docker-inproduction/
