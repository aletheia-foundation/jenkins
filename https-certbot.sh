#!/usr/bin/env bash
sudo apt-get update
sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install -y python-certbot-nginx

sudo certbot certonly --nginx --agree-tos -n -d jenkins.aletheia-foundation.org -d faucet.aletheia-foundation.org --register-unsafely-without-email
# backup nginx keys!

# then copy the nginx config from nginx folder
sudo systemctl restart nginx.service