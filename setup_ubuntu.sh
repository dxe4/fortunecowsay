apt-get install python-virtualenv nginx
virtualenv -p /usr/bin/python3 venv
source source_me
pip install -r requirements.txt
echo "
upstream app_server_djangoapp {
    server localhost:5000 fail_timeout=0;
}
server {
    #EC2 instance security group must be configured to accept http connections over Port 80
    listen 80;
    server_name $1
    access_log  /var/log/nginx/guni-access.log;
    error_log  /var/log/nginx/guni-error.log info;

    keepalive_timeout 5;

    location / {
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $http_host;
        proxy_redirect off;

        if (!-f $request_filename) {
            break;
        }
    }
}

" > /etc/nginx/sites-enabled/default