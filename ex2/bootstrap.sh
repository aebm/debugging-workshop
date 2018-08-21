#!/bin/bash

set -e

if [ $(id -u) -ne 0 ]; then
    echo "You must run this script as root. Attempting to sudo" 1>&2
    exec sudo -H -n bash $0 $@
fi

sleep 10

apt-get update
apt-get upgrade -y
apt-get install -y git python3-pip

wget -O /usr/local/bin/dbtm https://github.com/avishai-ish-shalom/debug-this-motherfucker/releases/download/v0.0.2/dbtm
chmod +x /usr/local/bin/dbtm

#install flaskr

mkdir /app
cd /tmp
# clone the repository
git clone https://github.com/pallets/flask
cd flask
# checkout the correct version
git tag  # shows the tagged versions
git checkout 1.0.2
cp -a examples/tutorial/* /app/
cd /app/
pip3 install gunicorn flask
FLASK_ENV=development FLASK_APP=flaskr flask init-db

cat - >wsgi.py <<EOF
from flaskr import create_app
app = create_app()
EOF


cat - >/etc/systemd/system/blog.service <<EOF
[Unit]
Description=blog service
After=network.target

[Service]
ExecStart=/usr/local/bin/gunicorn -w 2 -b :8000 wsgi:app
Restart=always
RestartSec=10
WorkingDirectory=/app

[Install]
WantedBy=multi-user.target
EOF

systemctl enable blog
cat > /etc/rc.local <<EOF
#!/bin/bash
/usr/local/bin/dbtm shadow-directory
EOF
chmod +x /etc/rc.local
