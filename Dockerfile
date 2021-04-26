FROM jenkins/jenkins:lts

USER root
# Install test dependencies
RUN apt update && apt install -y python3.8 python3.8-distutils chromium-chromedriver
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3 get-pip.py
RUN pip3 install robotframework
RUN pip3 install robotframework-seleniumlibrary
RUN pip3 install robotframework-lint

# Create Jenkins Log Folder
RUN mkdir /var/log/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins

USER jenkins

# Set default options
ENV JAVA_OPTS="-Xmx8192m"
ENV JENKINS_OPTS="--handlerCountMax=300 --logfile=/var/log/jenkins/jenkins.log"