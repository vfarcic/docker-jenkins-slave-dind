Jenkins Swarm Agent
-------------------

Usage
-----

The environment variable COMMAND_OPTIONS has to be specified with non-empty value, which is a combination of all swarm client options you need. Please refer to this [Swarm Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Swarm+Plugin) for all available options.

Please see [jenkins-swarm-agent.yml](https://github.com/vfarcic/docker-flow-stacks/tree/master/jenkins#jenkins-swarm-agentyml) for an example how to use *Jenkins Swarm Agent* with Jenkins master username and password specified as environment variables.

Please see [jenkins-swarm-agent-secrets.yml](https://github.com/vfarcic/docker-flow-stacks/tree/master/jenkins#jenkins-swarm-agent-secretsyml) for an example how to use *Jenkins Swarm Agent* with Jenkins master username and password specified as Docker secrets.

Variables
-----

Password is only one mandatory variable the should be set.

| Variable                          | Description   |
|:----------------------------------|---------------|
| JENKINS_URL                       | The Jenkins URL. Default `http://jenkins:8080`|
| JENKINS_USERNAME                  | The Jenkins username. Default `jenkins-swarm-agent`|
| JENKINS_USERNAME_FILE             | The filename to Jenkins username. Default `/run/secrets/jenkins-swarm-agent`|
| JENKINS_USERNAME_PASSWORD         | The password environment variable. |
| JENKINS_USERNAME_PASSWORD_FILE    | The filename secret to the password. Default `/run/secrets/jenkins-swarm-agent-password`|
| SWARM_CLIENT_OPTS                 | Additional [swarm client parameters](https://wiki.jenkins.io/display/JENKINS/Swarm+Plugin) from `java -jar swarm-client.jar --help` |

The `USERNAME`/`USERNAME_FILE` and `USERNAME_PASSWORD`/`USERNAME_PASSWORD_FILE` are mutually exclusive. If both values exist then secret files take precedence over environment variables.

**Warning:** It is not recommended to use the `JENKINS_USERNAME_PASSWORD` environment variable. The value will be logged out.

```sh
INFO: Client.main invoked with: [-master https://ci.myorg.com/ -username jenkins-swarm-agent -passwordEnvVariable f3j9fj34falsmslkmflsfmsl]
````
