#!/bin/bash
hostnamectl set-hostname apache-ubuntu-server
apt-get update
apt-get install apache2 -y
systemctl start apache2
systemctl enable apache2
echo -e "<h1> Ubuntu server with apache deployed by terraform, on host: ${hostname} </h1>" > /var/www/html/index.html
