
* Initial setup with Ubuntu 20.4: 
https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-20-04

* Install Mysql on Ubuntu 20.4:
https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-20-04

* Install LAMP (Linux, Apache, MySQL, PHP)
https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-20-04

* Install and Secure phpMyAdmin:
https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-phpmyadmin-on-ubuntu-20-04

* Secure Apache with Let's Encrypt on Ubuntu 20.04 (free TLS/SSL certificate)
https://www.digitalocean.com/community/tutorials/how-to-secure-apache-with-let-s-encrypt-on-ubuntu-20-04






WORKDIR /var/www/tuyen.tech

COPY /etc/apache2/sites-available/tuyen.tech.conf /etc/apache2/sites-available/
COPY /etc/apache2/conf-available/phpmyadmin.conf /etc/apache2/conf-available/
COPY /usr/share/phpmyadmin/.htaccess /usr/share/phpmyadmin/

COPY . /var/www/tuyen.tech/

RUN sudo apt update && apt install -y \
&& apache2 \
&& php libapache2-mod-php php-mysql \
&& mysql-server \
&& phpmyadmin php-mbstring php-zip php-gd php-json php-curl \
&& phpmyadmin 

RUN sudo mysql_secure_installation \
&& sudo mysql \
&& sudo phpenmod mbstring \
&& sudo htpasswd -c /etc/phpmyadmin/.htpasswd tuyen \
&& sudo systemctl restart apache2 

EXPOSE 9090




