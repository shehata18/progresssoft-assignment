# Apache Tomcat and JVM – Theory & Practice Guide

## 1. What is JVM (Java Virtual Machine)?
The JVM (Java Virtual Machine) is a runtime environment that allows Java applications to run on any operating system.  
It acts as a bridge between Java bytecode and the underlying operating system.

In simple terms:
- Java code is compiled into **bytecode**
- The JVM reads this bytecode and executes it
- This makes Java **platform-independent** (Write Once, Run Anywhere)

The JVM is responsible for:
- Memory management
- Garbage collection
- Thread management
- Security

---

## 2. What is an Application Server?
An application server is software that provides an environment to run web applications and business logic.

It handles:
- HTTP requests
- Application lifecycle
- Security
- Resource management
- Communication between components

Apache Tomcat is considered a **web application server** because it mainly handles:
- Java Servlets
- JSP (JavaServer Pages)
- WAR deployments

Examples of application servers:
- Apache Tomcat
- JBoss / WildFly
- WebLogic
- WebSphere

---

## 3. What is a WAR File?
A WAR (Web Application Archive) file is a packaged Java web application.

It contains:
- Compiled Java classes
- JSP files
- HTML/CSS/JS files
- Configuration files (web.xml)
- Libraries

### How Tomcat Handles a WAR File
- When a WAR file is placed inside Tomcat’s `webapps` directory
- Tomcat automatically extracts it
- The application is deployed and becomes accessible via a URL

### Deployment Location
/usr/local/tomcat/webapps/



---

## Practice Section

## 4. Installing Tomcat as a WebApp Container
Apache Tomcat is installed to serve Java web applications using Java 8 and Tomcat 9.

Steps overview:
- Install Java 8
- Download and configure Apache Tomcat 9
- Start Tomcat service
- Deploy WAR files into `webapps` directory

---

```bash
sudo apt update
sudo apt install openjdk-11-jdk -y
java -version
```

**Download & Install Tomcat 9**

```bash
cd /opt
sudo wget https://archive.apache.org/dist/tomcat/tomcat9/v9.0.89/bin/apache-tomcat-9.0.89.tar.gz
sudo tar -xvf apache-tomcat-9.0.89.tar.gz
sudo mv apache-tomcat-9.0.89 tomcat9
```

**Start Tomcat**
```bash
/opt/tomcat9/bin/startup.sh
```
**Access:**
http://localhost:8080

---


## 5. Reverse Proxy Setup with Nginx
Nginx is used as a reverse proxy in front of Tomcat.

### Purpose of Reverse Proxy:
- Expose the application on port 80
- Hide Tomcat internal port
- Improve security and scalability
- Allow DNS-based access

### Flow:
Client → DNS → Nginx (Port 80) → Tomcat (Port 7070)


Nginx listens on port 80 and forwards requests to Tomcat.

---

## 6. Changing Tomcat Port to 7070
By default, Tomcat runs on port 8080.

To change the port:
- Edit `server.xml`
- Change the connector port from `8080` to `7070`

Example:
```xml
<Connector port="7070" protocol="org.apache.coyote.http11.Http11NioProtocol"
           connectionTimeout="20000"
           redirectPort="8443" />
```
---

## Nginx Reverse Proxy:
**Install nginx**
```bash
sudo apt install nginx -y
```
**Configure Nginx**
```bash
sudo nano /etc/nginx/sites-available/tomcat
```
---
```xml
server {
    listen 80;
    server_name tomcat.local;

    location / {
        proxy_pass http://localhost:7070;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```
**Enable page or site**
```bash
sudo ln -s /etc/nginx/sites-available/tomcat /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx
```

**To add DNS entry:**
```bash
sudo vim /etc/hosts
```

```bash
127.0.0.1 tomcat.local
```
---
**Then Access it:**
http://tomcat.local
