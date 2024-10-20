# This script is used to install all the required plugins which are mentioned in plugins.text file and restart jenkins after installing the plugins
#! bin/bash
set -X
for plugin in $(cat plugins.txt); do \
    java -jar /home/ubuntu/jenkins-cli.jar \
    -s http://localhost:8080/ \
    -auth admin2:admin2 \
    install-plugin $plugin; \
done

java -jar /home/ubuntu/jenkins-cli.jar -s http://localhost:8080 -auth admin2:admin2 safe-restart
