
This is a guide on how to quickly put joomla in production with docker in few minutes.   
 
Use this repo docker-compose-joomla.yml   

## Preparations before run:
1. Create the static folders, where your data will be saved:   
``` mkdir -p /srv/docker/smartprojects/mysql ```   
``` mkdir -p /srv/docker/smartprojects/joomla_www ```   
``` mkdir -p /srv/docker/smartprojects/phpmyadmin/sessions ```   

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

