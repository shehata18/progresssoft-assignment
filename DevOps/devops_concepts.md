## Key DevOps Concepts

### RAID

**RAID (Redundant Array of Independent Disks)** is a data storage virtualization technology that combines multiple physical disk drives into one or more logical units for data redundancy, performance improvement, or both.

#### Common RAID Levels

**RAID 0 (Striping):**
- Data is split across multiple disks
- Improved performance (read/write)
- No redundancy (if one disk fails, all data is lost)
- Use case: High-performance applications where data loss is acceptable

**RAID 1 (Mirroring):**
- Data is duplicated on two or more disks
- High redundancy
- Read performance improvement
- 50% storage efficiency (for 2 disks)
- Use case: Critical data that requires high availability

**RAID 5 (Striping with Parity):**
- Data and parity information distributed across 3+ disks
- Can survive single disk failure
- Good balance of performance, storage, and redundancy
- Requires minimum 3 disks
- Use case: File servers, application servers

**RAID 6 (Striping with Double Parity):**
- Similar to RAID 5 but with double parity
- Can survive two simultaneous disk failures
- Requires minimum 4 disks
- Use case: Large storage arrays, critical data

**RAID 10 (1+0, Mirrored Striping):**
- Combines RAID 1 and RAID 0
- High performance and redundancy
- Requires minimum 4 disks
- 50% storage efficiency
- Use case: Database servers, high-transaction applications

#### Benefits of RAID

- **Data Redundancy:** Protection against disk failures
- **Improved Performance:** Faster read/write operations
- **Increased Availability:** System continues operating despite disk failures
- **Scalability:** Easy to add more storage capacity

### DevOps

**DevOps** is a cultural and technical movement that emphasizes collaboration between software development (Dev) and IT operations (Ops) teams to automate and streamline the software delivery process.

#### Core Principles

- **Collaboration:** Breaking down silos between development and operations
- **Automation:** Automating repetitive tasks (testing, deployment, infrastructure)
- **Continuous Integration/Continuous Delivery (CI/CD):** Frequent code integration and automated deployment
- **Monitoring and Feedback:** Continuous monitoring and rapid feedback loops
- **Infrastructure as Code (IaC):** Managing infrastructure through code

#### DevOps Lifecycle

1. **Plan:** Define requirements and plan development
2. **Code:** Write and version control code
3. **Build:** Compile and build application
4. **Test:** Automated testing (unit, integration, security)
5. **Release:** Package application for deployment
6. **Deploy:** Deploy to production environments
7. **Operate:** Manage and maintain production systems
8. **Monitor:** Track performance and issues

#### DevOps Tools Ecosystem

- **Version Control:** Git, GitHub, GitLab, Bitbucket
- **CI/CD:** Jenkins, GitLab CI, GitHub Actions, CircleCI, Travis CI
- **Configuration Management:** Ansible, Puppet, Chef, SaltStack
- **Containerization:** Docker, Podman
- **Orchestration:** Kubernetes, Docker Swarm, OpenShift
- **Infrastructure as Code:** Terraform, CloudFormation, Pulumi
- **Monitoring:** Prometheus, Grafana, ELK Stack, Datadog, New Relic
- **Collaboration:** Slack, Jira, Confluence

#### Benefits of DevOps

- Faster time to market
- Improved collaboration and communication
- Higher quality software
- Reduced deployment failures
- Faster recovery from failures
- Better resource utilization

### High Availability and Disaster Recovery

#### High Availability (HA)

**High Availability** refers to systems designed to operate continuously without failure for a long period. The goal is to minimize downtime and ensure services remain accessible.

**Key Metrics:**
- **Availability Percentage:**
  - 99.9% (Three Nines) = ~8.76 hours downtime/year
  - 99.99% (Four Nines) = ~52.56 minutes downtime/year
  - 99.999% (Five Nines) = ~5.26 minutes downtime/year

**HA Components:**
- **Redundancy:** Duplicate components (servers, network, storage)
- **Failover:** Automatic switching to standby system
- **Load Balancing:** Distributing traffic across multiple servers
- **Clustering:** Multiple servers working together as one system
- **Health Monitoring:** Continuous monitoring of system health

**HA Technologies:**

**Oracle Database HA:**
- Oracle Real Application Clusters (RAC)
- Oracle Data Guard (standby databases)
- Oracle GoldenGate (replication)
- Automatic Storage Management (ASM)

**PostgreSQL HA:**
- Streaming Replication (master-slave)
- Patroni (automated failover)
- pgpool-II (connection pooling and load balancing)
- Replication Manager (repmgr)
- Logical Replication

**Tomcat HA:**
- Clustering with session replication
- Load balancing with Apache/Nginx
- Database connection pooling
- Shared storage for application files

#### Disaster Recovery (DR)

**Disaster Recovery** is the process of restoring systems and data after a catastrophic event (natural disaster, cyberattack, hardware failure).

**Key Metrics:**
- **RTO (Recovery Time Objective):** Maximum acceptable downtime
- **RPO (Recovery Point Objective):** Maximum acceptable data loss (time)

**DR Strategies:**

**Backup and Restore:**
- Regular backups stored offsite
- Lowest cost, highest recovery time
- RPO: Hours to days, RTO: Days

**Pilot Light:**
- Minimal version always running in DR site
- Core systems ready, scaled up during disaster
- RPO: Minutes to hours, RTO: Hours

**Warm Standby:**
- Scaled-down version always running
- Can handle limited traffic
- RPO: Minutes, RTO: Hours

**Hot Standby (Active-Active):**
- Fully operational duplicate environment
- Traffic distributed between sites
- RPO: Seconds, RTO: Minutes or none

**DR Technologies:**

**Oracle DR:**
- Data Guard with physical/logical standby
- RMAN (Recovery Manager) backups
- Oracle GoldenGate for active-active replication
- Flashback Database for point-in-time recovery

**PostgreSQL DR:**
- Continuous archiving and Point-in-Time Recovery (PITR)
- Streaming replication to remote site
- Barman (Backup and Recovery Manager)
- pgBackRest for backup management

**Tomcat DR:**
- Application and configuration backups
- Database replication to DR site
- Synchronized deployment packages
- DNS failover to DR environment

**Best Practices:**
- Regular backup testing
- Documented recovery procedures
- Automated failover where possible
- Regular DR drills and simulations
- Geographic redundancy
- Monitoring and alerting

### Cloud Computing

**Cloud Computing** is the delivery of computing services (servers, storage, databases, networking, software) over the internet, enabling faster innovation, flexible resources, and economies of scale.

#### Service Models

**IaaS (Infrastructure as a Service):**
- Provides virtualized computing resources over the internet
- User manages: OS, middleware, runtime, applications, data
- Provider manages: Virtualization, servers, storage, networking
- Examples: AWS EC2, Google Compute Engine, Azure Virtual Machines
- Use cases: Development/testing, website hosting, storage and backup

**PaaS (Platform as a Service):**
- Provides platform for developing, running, and managing applications
- User manages: Applications, data
- Provider manages: Runtime, middleware, OS, virtualization, servers, storage, networking
- Examples: AWS Elastic Beanstalk, Google App Engine, Azure App Service, Heroku
- Use cases: Application development, API development, business analytics

**SaaS (Software as a Service):**
- Provides complete software applications over the internet
- User manages: Data, access
- Provider manages: Everything else
- Examples: Gmail, Salesforce, Microsoft 365, Dropbox, Slack
- Use cases: Email, CRM, collaboration tools, productivity applications

#### Deployment Models

**Public Cloud:**
- Services offered over public internet
- Shared infrastructure
- Examples: AWS, Azure, Google Cloud

**Private Cloud:**
- Dedicated infrastructure for single organization
- On-premises or hosted
- Greater control and security

**Hybrid Cloud:**
- Combination of public and private clouds
- Data and applications shared between environments

**Multi-Cloud:**
- Using services from multiple cloud providers
- Avoid vendor lock-in

#### Major Cloud Vendors

**Amazon Web Services (AWS):**
- Market leader
- Comprehensive service portfolio
- Global infrastructure
- Strong enterprise adoption

**Microsoft Azure:**
- Strong integration with Microsoft products
- Enterprise focus
- Hybrid cloud capabilities

**Google Cloud Platform (GCP):**
- Strong in data analytics and machine learning
- Kubernetes origin
- Competitive pricing

**Other Vendors:**
- IBM Cloud
- Oracle Cloud
- Alibaba Cloud
- DigitalOcean (developer-focused)

#### Benefits of Cloud Computing

- **Cost Efficiency:** Pay only for what you use
- **Scalability:** Easily scale resources up or down
- **Flexibility:** Access from anywhere
- **Reliability:** Built-in redundancy and backup
- **Security:** Advanced security features
- **Innovation:** Access to latest technologies

### DNS and Load Balancers

#### DNS (Domain Name System)

**DNS** translates human-readable domain names (www.example.com) into IP addresses (192.0.2.1) that computers use to identify each other.

**DNS Components:**

**DNS Records:**
- **A Record:** Maps domain to IPv4 address
- **AAAA Record:** Maps domain to IPv6 address
- **CNAME Record:** Alias of one domain to another
- **MX Record:** Mail exchange servers
- **TXT Record:** Text information (SPF, DKIM for email)
- **NS Record:** Name servers for domain
- **PTR Record:** Reverse DNS lookup

**DNS Hierarchy:**
1. **Root Servers:** Top-level DNS servers (.)
2. **TLD Servers:** Top-level domain servers (.com, .org, .net)
3. **Authoritative Name Servers:** Hold actual DNS records
4. **Recursive Resolvers:** Query DNS on behalf of clients

**DNS Process:**
1. User enters www.example.com in browser
2. Browser checks local cache
3. Query sent to recursive resolver (ISP DNS)
4. Resolver queries root server
5. Root directs to TLD server (.com)
6. TLD directs to authoritative name server
7. Authoritative server returns IP address
8. Browser connects to IP address

**DNS for High Availability:**
- **Round Robin DNS:** Distribute requests across multiple IPs
- **GeoDNS:** Route based on geographic location
- **Failover DNS:** Automatic failover to backup servers
- **DNS Load Balancing:** Distribute traffic across servers

**Popular DNS Providers:**
- AWS Route 53
- Cloudflare DNS
- Google Cloud DNS
- Azure DNS

#### Load Balancers

**Load Balancers** distribute incoming network traffic across multiple servers to ensure no single server becomes overwhelmed, improving application availability and responsiveness.

**Types of Load Balancers:**

**Layer 4 Load Balancing (Transport Layer):**
- Works at TCP/UDP level
- Routes based on IP address and port
- Fast and efficient
- No content inspection
- Examples: AWS Network Load Balancer, HAProxy (Layer 4 mode)

**Layer 7 Load Balancing (Application Layer):**
- Works at HTTP/HTTPS level
- Routes based on content (URL, headers, cookies)
- Advanced routing capabilities
- SSL termination
- Examples: AWS Application Load Balancer, Nginx, HAProxy (Layer 7 mode)

**Load Balancing Algorithms:**

**Round Robin:**
- Distributes requests sequentially
- Simple and effective for identical servers

**Least Connections:**
- Routes to server with fewest active connections
- Good for varying request durations

**IP Hash:**
- Routes based on client IP address
- Ensures same client always goes to same server

**Weighted Round Robin:**
- Assigns weight to servers based on capacity
- More powerful servers receive more requests

**Least Response Time:**
- Routes to server with fastest response time
- Optimizes user experience

**Load Balancer Features:**

**Health Checks:**
- Regularly check server availability
- Remove unhealthy servers from pool
- Automatic failover

**Session Persistence (Sticky Sessions):**
- Route user to same server for session duration
- Important for stateful applications

**SSL/TLS Termination:**
- Load balancer handles SSL decryption
- Reduces load on backend servers

**Content-Based Routing:**
- Route based on URL path, headers, or other content
- Enable microservices architecture

**Popular Load Balancer Solutions:**

**Hardware Load Balancers:**
- F5 BIG-IP
- Citrix ADC (NetScaler)
- High performance, expensive

**Software Load Balancers:**
- **Nginx:** High-performance web server and reverse proxy
- **HAProxy:** Reliable, high-performance TCP/HTTP load balancer
- **Apache HTTP Server:** With mod_proxy_balancer

**Cloud Load Balancers:**
- **AWS:** Application Load Balancer (ALB), Network Load Balancer (NLB)
- **Azure:** Azure Load Balancer, Application Gateway
- **Google Cloud:** Cloud Load Balancing

---

## Resources

### Documentation
- [Docker Documentation](https://docs.docker.com/)
- [Kubernetes Documentation](https://kubernetes.io/docs/)
- [Git Documentation](https://git-scm.com/doc)
- [AWS Documentation](https://docs.aws.amazon.com/)
- [Oracle HA](https://www.oracle.com/database/technologies/high-availability.html)
