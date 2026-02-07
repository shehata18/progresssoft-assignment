# Tomcat Vagrant Automation

This directory contains the Vagrant setup used to automate the deployment
of Apache Tomcat on Ubuntu.

---

## Provisioning Tools Used

- Shell script: for system-level installation
- Ansible: for configuration validation and service checks

---

## Configuration

- Base Image: bento/ubuntu-24.04
- Memory: 2 GB
- CPU: 1
- Guest Port: 7070
- Host Port: 9090
- Java Version: OpenJDK 8
- Tomcat Version: Apache Tomcat 9

---

## Usage

```bash
vagrant up
```

Access Tomcat from host machine:

http://localhost:9090
