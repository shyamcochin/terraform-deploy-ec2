#!/bin/bash
echo "Hi I am Starting Deployment"
whoami
sudo apt-get update
sudo apt upgrade -y
sudo apt-get update
sudo apt-get install apache2 -y
sudo chown -R ubuntu:ubuntu /var/www/
sudo service apache2 restart
sudo echo "Hello World from Terraform Deployment" > /var/www/html/index.html
