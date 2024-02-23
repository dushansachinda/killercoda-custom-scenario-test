echo "Please wait until we prepare the environment !"
while [ ! -f /tmp/background0 ]; do sleep 1; done
echo "Creating Java environment variables"
echo "export JAVA_HOME='/usr/lib/jvm/java-11-openjdk-amd64/'" >> /etc/profile && source /etc/profile
echo Done.. Now you can start !