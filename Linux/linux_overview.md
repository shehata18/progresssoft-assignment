# Linux Overview

## 1. Introduction to Linux
Linux is an open-source, Unix-like operating system kernel created by Linus Torvalds in 1991. It is widely used in servers, cloud platforms, embedded systems, and desktops due to its stability, security, and flexibility.

Linux is typically distributed as a complete operating system called a **Linux Distribution (Distro)**, which bundles the Linux kernel with system tools, libraries, and applications.

---

## 2. Linux Architecture
Linux follows a layered architecture that separates hardware, system processes, and user applications.

### 2.1 Linux Architecture Layers
1. **Hardware**
   - CPU, memory, disks, network devices

2. **Kernel**
   - Core of the operating system
   - Manages:
     - Process scheduling
     - Memory management
     - Device drivers
     - File systems
     - Networking

3. **Shell**
   - Command-line interface between user and kernel
   - Examples: `bash`, `zsh`, `sh`

4. **System Libraries**
   - Provide functions for applications to interact with the kernel
   - Example: GNU C Library (glibc)

5. **User Applications**
   - Command-line tools and graphical applications
   - Examples: `ls`, `vim`, `docker`, browsers

---

## 3. Linux Directory Structure
Linux uses a hierarchical directory structure starting from the root (`/`).

### 3.1 Common Linux Directories

| Directory | Description |
|----------|------------|
| `/` | Root directory |
| `/bin` | Essential user binaries (ls, cp, mv) |
| `/sbin` | System binaries (shutdown, reboot) |
| `/etc` | Configuration files |
| `/home` | User home directories |
| `/root` | Home directory for root user |
| `/var` | Variable files (logs, mail, cache) |
| `/usr` | User programs and libraries |
| `/lib` | Shared libraries |
| `/tmp` | Temporary files |
| `/dev` | Device files |
| `/proc` | Virtual filesystem for system info |
| `/opt` | Optional software packages |

---

## 4. Linux Distributions
A Linux distribution is a complete operating system built around the Linux kernel.

### 4.1 Popular Linux Distributions

- **Ubuntu** – User-friendly, widely used in cloud and servers
- **Debian** – Stable and secure
- **CentOS / Rocky Linux / AlmaLinux** – Enterprise servers
- **Red Hat Enterprise Linux (RHEL)** – Commercial enterprise OS
- **Fedora** – Cutting-edge features
- **Arch Linux** – Minimal and highly customizable
- **Kali Linux** – Security and penetration testing

### 4.2 Distribution Categories
- **Desktop Distributions** (Ubuntu, Fedora)
- **Server Distributions** (RHEL, Rocky Linux)
- **Security Distributions** (Kali Linux)
- **Lightweight Distributions** (Alpine Linux)

---

## 5. Linux File Systems
Linux supports multiple file systems, including:

- `ext4` – Most common Linux filesystem
- `xfs` – High-performance filesystem
- `btrfs` – Advanced features like snapshots
- `nfs` – Network file system

---

## 6. Linux Users and Permissions
Linux is a multi-user operating system.

### 6.1 User Types
- **Root user** – Full administrative access
- **Regular users** – Limited permissions

### 6.2 File Permissions
Each file has:
- Read (r)
- Write (w)
- Execute (x)

Applied to:
- Owner
- Group
- Others

Example:
```bash
-rwxr-xr--
```
### 7. Why Linux is Widely Used

- Open-source and free
- High security and stability
- Strong community support
- Excellent for servers and DevOps
- Dominant in cloud and container environments

### 8.Conclusion
Linux is a powerful and flexible operating system used across servers, cloud platforms, and enterprise environments. Understanding its architecture, directory structure, and distributions is essential for system administrators, DevOps engineers, and backend developers.