sudo whoami
ls /etc/ssh/sshd_config.d/
sudo nano /etc/ssh/sshd_config.d/00-hardening.conf
sudo sshd -t
sudo systemctl restart ssh


sudo apt update
sudo apt list --upgradable
sudo apt upgrade
sudo apt update
sudo apt install git mc curl zip unzip -y

sudo apt install apache2
sudo systemctl status apache2
hostname -I

sudo apt update && sudo apt upgrade -y
sudo apt install -y lsb-release ca-certificates curl apt-transport-https software-properties-common gnupg2
sudo apt install -y lsb-release ca-certificates curl apt-transport-https gnupg2

sudo wget -O /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
sudo apt update

sudo apt install php8.4 libapache2-mod-php8.4 php8.4-cli php8.4-fpm php8.4-mysql php8.4-zip php8.4-xml php8.4-gd php8.4-curl php8.4-mbstring php8.4-bcmath php8.4-soap php8.4-readline php8.4-intl php8.4-common php8.4-sqlite3
php -v
php -m

sudo apt update && sudo apt upgrade -y
sudo apt install wget gnupg 
wget https://dev.mysql.com/get/mysql-apt-config_0.8.39-1_all.deb
sudo apt install ./mysql-apt-config_0.8.39-1_all.deb
sudo apt update
sudo apt install mysql-server

sudo mysql_secure_installation
mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -u root -p mysql
sudo nano /etc/apache2/mods-enabled/dir.conf

sudo a2enmod proxy_fcgi setenvif rewrite actions
sudo a2enconf php8.4-fpm
sudo a2dismod php8.4 mpm_prefork
sudo a2enmod mpm_event
sudo systemctl restart apache2
sudo systemctl enable --now php8.4-fpm
sudo a2query -m | grep -E 'event|proxy_fcgi'   # мають бути enabled
echo "<?php phpinfo();" | sudo tee /var/www/html/info.php

sudo systemctl restart php8.4-fpm
sudo systemctl restart apache2

$ sudo chown -R $USER:www-data /var/www
sudo chown -R $USER:www-data /var/www

sudo a2dismod autoindex
sudo systemctl restart apache2

cd /var/www/
wget https://files.phpmyadmin.net/phpMyAdmin/5.2.3/phpMyAdmin-5.2.3-all-languages.zip
unzip phpMyAdmin-*.zip

sudo mc /etc/apache2
sudo a2ensite pma.true-coders.com.conf
systemctl reload apache2
sudo systemctl reload apache2
sudo chown -R www-data:$USER /var/www/phpmyadmin
cd /var/www

unzip -v
sudo apt update
curl -sS https://getcomposer.org/installer -o composer-setup.php
HASH=$(curl -sS https://composer.github.io/installer.sig)
php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
rm composer-setup.php
composer --version
sudo composer self-update

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.5/install.sh | bash
\. "$HOME/.nvm/nvm.sh"
source ~/.profile
nvm --version
nvm ls-remote
nvm install v24.17.0
node -v
npm -v
source ~/.bashrc

sudo reboot
sudo apt update
sudo apt upgrade

sudo apt install python3 python3-venv python3-pip
python3 -V

sudo apt update && sudo apt upgrade -y
sudo apt install snapd
sudo snap install core
sudo snap refresh core
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot
sudo ln -s /snap/bin/certbot /usr/local/bin/certbot
certbot -v
certbot --version
cd /var/www

unzip ./true-coders.com.zip -d /var/www

sudo chown -R www-data:$USER /var/www/true-coders.com

sudo a2dissite 000-default.conf
sudo a2ensite true-coders.com.conf

sudo systemctl reload apache2
sudo systemctl reload php8.4-fpm

cd /var/www/true-coders.com
git status
git config --global --add safe.directory /var/www/true-coders.com
git status

sudo systemctl reload php8.4-fpm
cd /var/www/true-coders.com
sudo systemctl reload apache2

dig +short true-coders.com
dig +short www.true-coders.com
grep -ri "www" /etc/apache2/sites-enabled/
sudo mc /etc/apache2
sudo cat /etc/apache2/sites-enabled/*.conf
sudo grep -rniE "redirect|rewriterule|rewritecond" /etc/apache2/sites-enabled/
sudo grep -rniE "redirect|rewriterule" /etc/apache2/
sudo find /var/www/ -name .htaccess -exec grep -l -i "redirect\|rewrite" {} \;
curl -IL http://true-coders.com
curl -I -H "Host: true-coders.com" http://localhost
sudo tail -n 50 /var/log/apache2/error.log

ls -la /var/www/true-coders.com/
cat /etc/apache2/conf-enabled/php8.4-fpm.conf
ls -la /var/www/true-coders.com/
cat /etc/apache2/conf-enabled/php8.4-fpm.conf
sudo tail -n 50 /var/log/php8.4-fpm.log

dig +short MX true-coders.com
dig +short true-coders.com
curl -IL http://true-coders.com
sudo chown -R www-data:www-data ./true-coders.com
sudo chown -R www-data:$USER ./true-coders.com
sudo chown -R www-data:$USER ./phpmyadmin
cd ~

sudo certbot --apache -d true-coders.com -d www.true-coders.com
sudo systemctl status certbot.timer
sudo certbot renew --dry-run

cd /var/www/true-coders.com
git status

git status
git add --all
git status
git commit -m "Plugins Updates"
git status
git commit -m "Plugins Updates"
git config --global user.email "ionscript.inc@gmail.com"
git config --global user.name "ionscript"
git commit -m "Plugins Updates"
git status
git push origin main
git status
git pull ortigin main
git pull origin main
sudo chown -R www-data:$USER /var/www/true-coders.com

sudo mc
git status
git add --all
git status
git commit -m "DB Backup (PROD)"
git status
git push origin main
sudo chown -R www-data:$USER /var/www/true-coders.com

unzip /var/www/archive.zip -d /var/www
cd /var/www

sudo chown -R www-data:$USER /var/www/agroland-promo
sudo chown -R www-data:$USER /var/www/energyland-promo
sudo chown -R www-data:$USER /var/www/urbanland-promo
cd  /var/www/agroland-promo
php artisan list
composer install
sudo chown -R $USER:www-data /var/www/agroland-promo
composer install

npm install 
npm audit fix
npm run build
php artisan list
