#! /bin/bash -e

mkdir -p /var/jenkins_home/.ssh
mv /usr/share/jenkins/ref/.ssh/id_rsa /var/jenkins_home/.ssh
chmod 600 /var/jenkins_home/.ssh/id_rsa

echo "start JENKINS"
# if 'docker run' first argument start with '--' the user is passing jenkins launcher arguments
if [[ $# -lt 1 ]] || [[ "$1" == "--"* ]]; then
    exec /bin/tini -- /usr/local/bin/jenkins.sh "$@"
fi
exec "$@"