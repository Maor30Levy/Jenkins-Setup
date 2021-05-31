FROM jenkins/jenkins

USER root



RUN echo "Acquire::Check-Valid-Until \"false\";\nAcquire::Check-Date \"false\";" | cat > /etc/apt/apt.conf.d/10no--check-valid-until
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y sudo
RUN apt-get install -y curl

#aws-cli installation 
RUN apt-get install -y \
        python3 \
        python3-pip \
        python3-setuptools \
        groff \
        less \
    && pip3 install --upgrade pip \
    && apt-get clean
RUN pip3 --no-cache-dir install --upgrade awscli

CMD ["/bin/bash"]

# # Install Docker

# RUN apt-get update && \
#      apt-get -y install apt-transport-https \
#      ca-certificates \
#      curl \
#      gnupg2 \
#      software-properties-common && \
#      curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
#      add-apt-repository \
#      "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
#      $(lsb_release -cs) \
#      stable" && \
#      apt-get update && \
#      apt-get -y install docker-ce

# RUN apt-get -y install sudo

# RUN chown 1000 -R /var

# # COmpose

# RUN curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose

# RUN usermod -aG docker jenkins

USER jenkins

