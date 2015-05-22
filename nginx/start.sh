docker rm -f nginx_balancer
docker run -d -p 80:80 --name nginx_balancer \
       -v ~/lo2k_infrastructure/nginx/sites-enabled:/etc/nginx/sites-enabled \
       -v  ~/lo2k_infrastructure/nginx/logs:/var/log/nginx \
       -v  ~/lo2k_infrastructure/nginx/html:/var/www \
       --link weblog_wordpress_1:weblog \
       xblaster/nginx  
