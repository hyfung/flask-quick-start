# flask-quick-start
Simple flask app

# Setup Procedures
```
Placeholder
```
# Deployment Options

## Deploy using Apache2
Install libapache2-mod-wsgi-py3
```
sudo apt-get install apache2
sudo apt-get install libapache2-mod-wsgi-py3
```

Create /var/www/flask_app/flask_app.wsgi
```
import sys,logging

logging.basicConfig(stream=sys.stderr)
sys.path.insert(0, "/var/www/flask_app")

from app import app as application
application.secret_key="YOUR_SECRET_KEY"
```

Modify /etc/apache2/000-default.conf
```
<VirtualHost *:80>
	#ServerName www.example.com

	ServerAdmin webmaster@localhost

	WSGIDaemonProcess flask_app threads=4
	WSGIScriptAlias / /var/www/flask_app/flask_app.wsgi

	<Directory /var/www/flask_app/app>
        WSGIProcessGroup flask_app
        WSGIScriptReloading On
        WSGIApplicationGroup %{GLOBAL}
		Order allow,deny
		Allow from all
	</Directory>

	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
```

## Deploy using uWSGI
```
Placeholder
```

## Deploy using Gnicorn
CD to the directory with app/ and run the following command
```
gunicorn3 app:app
```

## Deploy using Docker
To create a docker image, do the followings
```
sudo docker build --tag local:flask_app .
```

To run the app, do the followings
```
sudo docker container run -d --network host --name flask_app local:flask_app
```
