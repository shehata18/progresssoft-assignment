## Linux Users and Groups

```bash
sudo groupadd PSgroup
sudo groupadd dba
sudo useradd -m -g PSgroup -G dba PS
sudo passwd PS
```

## Root Password Modification

```bash
sudo passwd root 
```