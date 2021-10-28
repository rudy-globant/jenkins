FROM jenkins/jenkins

COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/install-plugins.sh < usr/share/jenkins/plugins.txt

USER root

RUN curl https://get.docker.com/ > dockerinstall \
    && chmod 777 dockerinstall && ./dockerinstall \
    && usermod -aG docker jenkins && rm -rf dockerinstall

RUN apt install -y openjdk-11-jdk && apt clean
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

USER jenkins