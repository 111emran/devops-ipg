#!/bin/bash
sudo apt-get update
sudo apt-get install git -y
cd /home/ubuntu
sudo git clone https://github.com/111emran/devops-ipg.git
sudo chown -R ubuntu:ubuntu devops-ipg
sudo apt-get update
sudo apt-get install curl php php7.4 php7.4-mbstring php7.4-mysql php7.4-xml php7.4-curl php7.4-json php7.4-zip  -y
cd /home/ubuntu
sudo apt-get update
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
sudo apt-cache madison docker-ce
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo docker-compose --version
sudo docker run hello-world 
sudo usermod -aG docker ubuntu 
sudo service apache2 stop -y
cd /home/ubuntu/devops-ipg/
sudo docker-compose up -d --build
