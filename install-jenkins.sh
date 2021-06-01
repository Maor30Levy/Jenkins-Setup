#/bin/bash/
docker network create jenkins
./dockerDIND.sh
docker build -t jenkins-server:latest .
./run-jenkins.sh
docker logs jenkins-server
