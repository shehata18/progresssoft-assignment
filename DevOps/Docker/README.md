# Docker

## 2. What is Docker?
Docker is a containerization platform that allows applications to run in isolated environments called **containers**.

Containers package:
- Application code
- Dependencies
- Runtime environment

This ensures the application runs consistently across different systems.

---

## 3. Docker Use Cases
- Application packaging and deployment
- Microservices architecture
- CI/CD pipelines
- Development environment standardization
- Cloud-native applications

---

## 4. Basic Docker Commands

| Command | Description |
|------|------------|
| `docker build` | Build a Docker image |
| `docker run` | Run a container |
| `docker ps` | List running containers |
| `docker ps -a` | List all containers |
| `docker images` | List Docker images |
| `docker stop` | Stop a container |
| `docker rm` | Remove a container |
| `docker rmi` | Remove an image |

---

## 5. Dockerfile for Tomcat with Sample WAR

### Dockerfile Example
```dockerfile
FROM tomcat:9-jdk8

RUN rm -rf /usr/local/tomcat/webapps/*

COPY sample.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
```

**Steps Performed:**
- Uses Tomcat 9 with Java 8
- Removes default applications
- Deploys a sample WAR file
- Exposes port 8080

## 6. Push Image to Docker Registry

**1. Build image:**

```bash
docker build -t username/tomcat-app .
```

**2. Login to Docker Registry:**

```bash
docker login
```

**3. Push image:**

```bash
docker push username/tomcat-app
```
---

## 7. Running Nginx and PostgreSQL Containers

**Run Nginx**

```bash
docker run -d -p 80:80 nginx
```

**Run PostgreSQL**

```bash
docker run -d \
  --name postgres \
  -e POSTGRES_USER=admin \
  -e POSTGRES_PASSWORD=admin123 \
  -e POSTGRES_DB=mydb \
  -p 5432:5432 \
  postgres
```