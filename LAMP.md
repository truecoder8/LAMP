## Install LAMP

---

### Install utils
```sh
$ sudo apt install git mc curl zip unzip -y
```

---

### Install Apache2.4 Web Server
```sh
$ sudo apt update
$ sudo apt install apache2
```

### Add current user to server group "www-data"
```sh
$ sudo chown -R $USER:www-data /var/www
```

---

### Install Nginx
```sh
sudo apt update
sudo apt install nginx

sudo nano /etc/nginx/sites-available/your_domain
sudo ln -s /etc/nginx/sites-available/your_domain /etc/nginx/sites-enabled/
sudo nginx -t
```

---

### Install Mysql Server
```sh
$ sudo apt install mysql-server
$ sudo mysql_secure_installation
```

### Configure root mysql user
```sh
$ sudo mysql
```

```text
mysql> SELECT user,authentication_string,plugin,host FROM mysql.user;
mysql> ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
mysql> FLUSH PRIVILEGES;
mysql> SELECT user,authentication_string,plugin,host FROM mysql.user;
mysql> exit
```
### Load Time Zones
```sh
$ mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -u root -p mysql
```

---

### Install PHP
```sh
$ sudo add-apt-repository ppa:ondrej/php
$ sudo apt update
$ sudo apt upgrade
$ sudo apt install php7.3 libapache2-mod-php7.3 php7.3-mysql php7.3-common php7.3-cli php7.3-fpm php7.3-pdo php7.3-mysql php7.3-zip php7.3-gd php7.3-mbstring php7.3-curl php7.3-bcmath php7.3-json php7.3-xml php7.3-xmlrpc php7.3-gd php7.3-imagick php7.3-dev php7.3-imap php7.3-opcache php7.3-soap php7.3-zip php7.3-intl -y
$ sudo apt install php7.1 libapache2-mod-php7.1 php7.1-mysql php7.1-common php7.1-cli php7.1-fpm php7.1-pdo php7.1-mysql php7.1-zip php7.1-gd php7.1-mbstring php7.1-curl php7.1-bcmath php7.1-json php7.1-xml php7.1-xmlrpc php7.1-gd php7.1-imagick php7.1-dev php7.1-imap php7.1-opcache php7.1-soap php7.1-zip php7.1-intl -y
$ sudo apt install php7.4 libapache2-mod-php7.4 php7.4-mysql php7.4-common php7.4-cli php7.4-fpm php7.4-pdo php7.4-mysql php7.4-zip php7.4-gd php7.4-mbstring php7.4-curl php7.4-bcmath php7.4-json php7.4-xml php7.4-xmlrpc php7.4-gd php7.4-imagick php7.4-dev php7.4-imap php7.4-opcache php7.4-soap php7.4-zip php7.4-intl -y
```

### Configure Apache2 
```sh
$ sudo nano /etc/apache2/mods-enabled/dir.conf
```

```text
<IfModule mod_dir.c>
    DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
</IfModule>
```

```sh
$ sudo sh -c "a2enmod proxy_fcgi setenvif; a2enmod rewrite; a2enconf php7.4-fpm; a2enmod proxy_fcgi setenvif"
```

```sh
$ sudo a2enmod actions
```

```sh
$ sudo a2query -m
$ sudo a2dismod php7.4
$ sudo a2dismod mpm_prefork
$ sudo a2enmod mpm_event
```

#### restart Apache2
```sh
$ sudo systemctl restart apache2
```

#### Check Apache2 status
```sh
$ sudo systemctl status apache2
```

### Configure PHP
```sh
$ sudo nano /etc/php/7.3/apache2/php.ini
```

```text
upload_max_filesize = 32M 
post_max_size = 48M 
memory_limit = 256M 
max_execution_time = 600 
max_input_vars = 3000 
max_input_time = 1000
```

#### restart Apache2
```sh
$ sudo systemctl restart apache2
```

### Test PHP
```sh
$ nano /var/www/html/info.php
```

```php
<?php
  phpinfo();
?>
```

> http://localhost/info.php

```sh
$ rm /var/www/html/info.php
```

---

### Install Composer
```sh
$ sudo apt update
$ cd ~
$ curl -sS https://getcomposer.org/installer -o composer-setup.php
```

##### Go to link and
> https://composer.github.io/pubkeys.html

##### set composer hash: `HASH=<composer hash>`
```text
HASH=906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8
```

```sh
$ php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
$ sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
```

---

### Install NVM
```sh
$ curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
$ source ~/.profile 
$ source ~/.bashrc
$ nvm ls-remote
```

#### Install NodeJS v12
```sh
$ nvm install v12.18.4
```

---

### Install ZendServer (PHP 7.3)
```sh
$ sudo ./install_zs.sh 7.3
```
#### Post install ZendServer (PHP 7.3)
```sh
$ echo 'export PATH=$PATH:/usr/local/zend/bin' >> $HOME/.bashrc
$ echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/zend/lib' >> $HOME/.bashrc
```
### Uninstall zendServer
```sh
$ sudo /usr/local/zend/bin/uninstall.sh
```
### Manually Uninstall zendServer
```sh
$ sudo apt-get remove `dpkg -l | grep zend | grep ^ii | awk '{print $2}'`
$ sudo apt-get purge `dpkg -l | grep zend | awk '{print $2}'`
```
#### Set ZendServer PHP to Alternatives
```sh
$ sudo update-alternatives --install /usr/bin/php php /usr/local/zend/php/active/bin/php 1
$ php -i | grep "Loaded Configuration File"
```

### Certbot install
```sh
$ sudo add-apt-repository ppa:certbot/certbot
$ sudo apt-get update
$ sudo apt install certbot python3-certbot-nginx
#OR
$ sudo apt install certbot python3-certbot-apache
$ sudo certbot --nginx --apache -d example.com
$ sudo ls /etc/letsencrypt/live/example.com
```
