apt-get install python-virtualenv nginx
virtualenv -p /usr/bin/python3 venv
. ./venv/bin/activate
pip install -r requirements.txt
cp default /etc/nginx/sites-enabled/default