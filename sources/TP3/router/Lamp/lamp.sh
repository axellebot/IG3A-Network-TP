#!/bin/bash
###############################################
# Configure LAMP server
###############################################
# Install packages
#sudo apt install apache2 php mysql-server libapache2-mod-php php-mysql

DL_DIR ="~/Downloads"
HTML_DIR="/var/www/html"

echo "$DL_DIR"
echo "$HTML_DIR"

# phpMyAdmin
cd $DL_DIR
wget https://files.phpmyadmin.net/phpMyAdmin/4.7.7/phpMyAdmin-4.7.7-english.zip
unzip phpMyAdmin-4.7.7-english.zip
cp "$DL_DIR/phpMyAdmin-4.7.7-english" "$HTML_DIR/phpmyadmin" -r

# Wordpress
cd $DL_DIR
wget https://fr.wordpress.org/wordpress-4.9.1-fr_FR.zip
unzip wordpress.zip
cp "$DL_DIR/wordpress" "$HTML_DIR/wordpress" -r
