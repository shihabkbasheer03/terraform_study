#!/bin/bash
sudo yum update -y
sudo yum install -y wget unzip httpd
sudo systemctl start httpd
sudo systemctl enable httpd
wget https://www.tooplate.com/zip-templates/2117_infinite_loop.zip
unzip -o 2117_infinite_loop.zip
cp -r 2117_infinite_loop/* /var/www/html
sudo systemctl restart httpd
