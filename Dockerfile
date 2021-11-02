FROM jenkins/jenkins:lts-slim

COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/install-plugins.sh < usr/share/jenkins/plugins.txt

USER root

RUN curl https://get.docker.com/ > dockerinstall \
    && chmod 777 dockerinstall && ./dockerinstall \
    && usermod -aG docker jenkins && rm -rf dockerinstall

USER jenkins