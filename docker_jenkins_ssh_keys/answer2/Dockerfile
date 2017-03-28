FROM jenkins:2.32.3

# Disable setup wizard
ENV JAVA_OPTS="$JAVA_OPTS -Djenkins.install.runSetupWizard=false"

COPY plugins/plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt 

USER root

COPY ssh/ /ssh
COPY init.groovy.d/* /usr/share/jenkins/ref/init.groovy.d/

# Change owner of /ssh directory and files under it to 
# jenkins user's owner (1000:1000)
RUN chown -R 1000:1000 /ssh

USER jenkins