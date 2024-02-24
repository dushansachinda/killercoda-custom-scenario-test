apt update
#apt install openjdk-11-jdk -y
apt install openjdk-17-jdk -y
echo "export JAVA_HOME='/usr/lib/jvm/java-17-openjdk-amd64/'" >> /etc/profile && source /etc/profile

sed 's/PORT/80/g' /etc/killercoda/host > /tmp/uihost
sed -i 's|https://||g' /tmp/uihost
sed 's/PORT/8080/g' /etc/killercoda/host > /tmp/apihost
sed -i 's|https://||g' /tmp/apihost


sed -ie "s|<HOST_NAME>|$(sed 's:http:http:g' /tmp/uihost)|g" /root/original-apim-deployment.toml
sed -ie "s|<GW_HOST>|$(sed 's:http:http:g' /tmp/apihost)|g" /root/original-apim-deployment.toml

echo "127.0.0.1 $(sed 's:http:http:g' /tmp/uihost)" >> /etc/hosts

echo done > /tmp/background0