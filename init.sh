#/bin/bash
sudo yum install -y docker
sudo yum install -y git
sudo service docker start
sudo chown 1000:1000 /var/run/docker.sock
git clone https://github.com/Maor30Levy/Jenkins-Setup.git
sudo chmod +x -R Jenkins-Setup
cd Jenkins-Setup
./install-jenkins.sh
