FROM jenkins/jenkins:2.277.4-lts-jdk11
USER root
RUN apt-get update && apt-get install -y apt-transport-https \
       ca-certificates curl gnupg2 \
       software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN apt-key fingerprint 0EBFCD88
RUN add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/debian \
       $(lsb_release -cs) stable"
RUN apt-get update && apt-get install -y docker-ce-cli

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

USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean:1.24.6 docker-workflow:1.26"



# RUN echo "Acquire::Check-Valid-Until \"false\";\nAcquire::Check-Date \"false\";" | cat > /etc/apt/apt.conf.d/10no--check-valid-until
# RUN apt-get update && apt-get upgrade -y
# RUN apt-get install -y sudo
# RUN apt-get install -y curl

# #aws-cli installation 
# RUN apt-get install -y \
#         python3 \
#         python3-pip \
#         python3-setuptools \
#         groff \
#         less \
#     && pip3 install --upgrade pip \
#     && apt-get clean
# RUN pip3 --no-cache-dir install --upgrade awscli

# CMD ["/bin/bash"]


# USER jenkins

