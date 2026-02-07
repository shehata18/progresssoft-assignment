# Kubernetes

## What is Kubernetes?

Kubernetes (K8s) is a container orchestration platform that automates:
- `Container deployment`
- `Scaling`
- `Load balancing`
- `Self-healing`

**Key Features**:

**Automated Rollouts and Rollbacks:** Deploy changes with zero downtime
**Service Discovery and Load Balancing:** Automatically distribute traffic across containers
**Storage Orchestration:** Mount storage systems automatically
**Self-Healing:** Restart failed containers, replace containers, and kill containers that don't respond
**Secret and Configuration Management:** Manage sensitive information securely
**Horizontal Scaling:** Scale applications up or down based on demand

## Master and Worker Nodes

### Master Node (Control plane)
`Purpose`
The master node is the brain of the Kubernetes cluster. It manages, controls, and makes decisions about the cluster.

**Responsible for:**
- Cluster management
- Scheduling pods
- API server
- Controller manager
- etcd (cluster state storage)

**Components:**

`API Server (kube-apiserver)`: Front-end for the Kubernetes control plane, handles all REST requests
`Scheduler (kube-scheduler)`: Assigns pods to nodes based on resource requirements
`Controller Manager (kube-controller-manager)`: Runs controller processes to regulate the state of the cluster
`etcd`: Distributed key-value store that stores all cluster data.

### Worker Node
Worker nodes run containerized applications and are managed by the master node.

**Responsible for:**

- Running application pods
- Container runtime (Docker/containerd)
- kubelet and kube-proxy

**Components**:

`Kubelet`: Agent that runs on each node, ensures containers are running in pods
`Kube-proxy`: Network proxy that maintains network rules for pod communication
`Container Runtime`: Software responsible for running containers (Docker, containerd, CRI-O)

---
## How to Identify Master vs Worker Nodes

**List all nodes with their roles*
```bash
kubectl get nodes
```

### Installation and Deployment

#### Option 1: MicroK8s

MicroK8s is a lightweight Kubernetes distribution perfect for development and testing.

```bash
# Install MicroK8s (Ubuntu/Debian)
sudo snap install microk8s --classic

# Add user to microk8s group
sudo usermod -a -G microk8s $USER
sudo chown -f -R $USER ~/.kube
newgrp microk8s

# Check status
microk8s status

# Enable common add-ons
microk8s enable dns dashboard storage

# Use kubectl
microk8s kubectl get nodes

# Create alias for convenience
alias kubectl='microk8s kubectl'
```

#### Option 2: K3s (Lightweight Kubernetes)

K3s is a lightweight Kubernetes distribution optimized for edge computing and IoT.

```bash
# Install K3s
curl -sfL https://get.k3s.io | sh -

# Check installation
sudo systemctl status k3s

# Use kubectl (K3s includes kubectl)
sudo k3s kubectl get nodes

# For non-root access
sudo chmod 644 /etc/rancher/k3s/k3s.yaml
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
```

#### Option 3: Minikube (Full-featured local Kubernetes)

**I already have minikube on ubuntu sub-system**

```bash
# Install Minikube (requires virtualization)
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

# Start Minikube
minikube start

# Check status
minikube status
kubectl get nodes
```

#### Option 4: Kubeadm (Full-featured Kubernetes)

# I used this method and recommend it

You can use full bash script from this link [Kubeadm Script](https://github.com/shehata18/kubernetes)



#### Sample Deployment

**Step 1: Create a Deployment YAML**

```yaml
# nginx-deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 2
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx
        ports:
        - containerPort: 80
```

**Step 3: Deploy the Application**

```bash
# Apply deployment
kubectl apply -f nginx-deployment.yaml

# Check deployment
kubectl get deployments
kubectl get pods
```


