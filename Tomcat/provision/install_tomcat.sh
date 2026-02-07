#!/bin/bash

echo "Updating system..."
apt update -y

echo "Installing Java 8..."
apt install -y openjdk-8-jdk wget curl

echo "Downloading Tomcat 9..."
cd /opt
wget -q https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.89/bin/apache-tomcat-9.0.89.tar.gz

echo "Extracting Tomcat..."
tar -xzf apache-tomcat-9.0.89.tar.gz
mv apache-tomcat-9.0.89 tomcat9

echo "Changing Tomcat port to 7070..."
sed -i 's/port="8080"/port="7070"/' /opt/tomcat9/conf/server.xml

echo "Starting Tomcat..."
/opt/tomcat9/bin/startup.sh
