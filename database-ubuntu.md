
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


* DOCKER COMPOSE & NETWORK
https://vsudo.net/blog/docker-toan-tap.html

<h3> CÓ 2 CÁCH ĐỂ SỬ DỤNG phpMyAdmin:
C1: cài đặt thủ công và sử dụng trên localhost hoặc domain trên server mình host (xem link trên)
https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-phpmyadmin-on-ubuntu-20-04 => đã thử và ok

C2:dùng Docker network chứa 2 container là MySQL và phpMyAdmin để truy cập MySQL server trên phpMyAdmin host
https://vsudo.net/blog/docker-toan-tap.html => đã thử và ok

<h3> Cách để đưa db của mình chạy trên container có sẵn của phpMyAdmin
B1: tạo image chạy trên base php cho file .php chứa truy vấn bảng của db (như 1 ứng dụng) và phải cài đặt biến môi trường trong này cho giống với config của container.
B2: compose với container của phpMyAdmin có sẵn (có thể chọn các image phù hợp nhu cầu) và bổ sung image ở trên vào file docker-compose.yml 


--------------------------------------------------


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


--------------------------
FROM ubuntu:latest

MAINTAINER tuyennnt <tuyendev96@gmail.com>
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

