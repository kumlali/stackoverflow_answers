FROM jenkins:2.32.3

# Copy ssh as .ssh
COPY ssh/ /usr/share/jenkins/ref/.ssh
COPY entrypoint.sh /entrypoint.sh

USER root

# Change owner of .ssh directory and files under it to
# jenkins user's owner (1000:1000) and make sure
# permisson of id_rsa is not 600.
RUN chown -R 1000:1000 /usr/share/jenkins/ref/.ssh \
    && chmod 644 /usr/share/jenkins/ref/.ssh/id_rsa

RUN chown 1000:1000 /entrypoint.sh \
    && chmod +x /entrypoint.sh

USER jenkins

ENTRYPOINT ["/entrypoint.sh"]