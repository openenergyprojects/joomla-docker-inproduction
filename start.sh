export AUTH_USER='someusr' # for ha pros stats page
export AUTH_PASS='Change!PASSWD!' # for ha pros stats page
rm -f /var/acme-webroot/dev/log || true
docker-compose -f docker-compose-haproxy.yml rm -f || true
docker-compose -f docker-compose-haproxy.yml up --remove-orphans -d
docker-compose -f docker-compose-haproxy.yml logs
