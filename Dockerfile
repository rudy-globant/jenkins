FROM jenkins/jenkins

COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/install-plugins.sh < usr/share/jenkins/plugins.txt

USER root

RUN curl https://get.docker.com/ > dockerinstall && chmod 777 dockerinstall && ./dockerinstall
RUN usermod -aG docker jenkins

USER jenkins