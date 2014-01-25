apt-get install python-virtualenv fortune cowsay
virtualenv -p /usr/bin/python3 venv
. ./venv/bin/activate
pip install -r requirements.txt
cp /usr/games/fortune /bin
cp /usr/games/cowsay /bin