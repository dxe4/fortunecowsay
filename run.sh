. ./venv/bin/activate
gunicorn -w 4 -b 0.0.0.0:80 run:app --daemon