#/bin/bash/
docker network create jenkins
./dockerDIND.sh
docker build -t myjenkins-blueocean:1.1 .
./run-jenkins.sh
docker logs jenkins-blueocean
