#!/usr/bin/env sh
${JENKINS_USERNAME_FILE:=/run/secrets/jenkins-swarm-agent}
if [ -f "${JENKINS_USERNAME_FILE}" ]; then  
    echo "Read Jenkins username form file ${JENKINS_USERNAME_FILE}"
    read JENKINS_USERNAME < ${JENKINS_USERNAME_FILE}  
fi

if [ -n "${JENKINS_USERNAME_PASSWORD}" ]; then
    echo "Using Password from the Env Variable JENKINS_USERNAME_PASSWORD"
    PASWD_OPT="-passwordEnvVariable ${JENKINS_USERNAME_PASSWORD}"  
fi

${JENKINS_USERNAME_PASSWORD_FILE:=/run/secrets/jenkins-swarm-agent-password}
if [ -f "${JENKINS_USERNAME_PASSWORD_FILE}" ]; then
    echo "Read Jenkins username password form file ${JENKINS_USERNAME_PASSWORD_FILE}"
    PASWD_OPT="-passwordFile ${JENKINS_USERNAME_PASSWORD_FILE}"
fi

if [ -z "${JENKINS_URL}" ]; then
    echo "Warning: The JENKINS_URL is not set, Using default URL http://jenkins:8080"
    JENKINS_URL="http://jenkins:8080"
fi

# Always try to download swarm-client from current jenkins.
wget ${JENKINS_URL}/swarm/swarm-client.jar 

# GROUP=$(stat -c %G /var/run/docker.sock)
# if [ ! $(grep ^$GROUP: /etc/group) ]; then
#     addgroup -G $(stat -c %g /var/run/docker.sock) $GROUP
# fi
# adduser jenkins $GROUP

# exec su jenkins -c "exec java -jar /home/jenkins/swarm-client.jar ${COMMAND_OPTIONS}"
java -jar /swarm-client.jar -master ${JENKINS_URL:="http://jenkins:8080"} -username ${USR:="jenkins-swarm-agent"} ${PASWD_OPT} ${SWARM_CLIENT_OPTS}