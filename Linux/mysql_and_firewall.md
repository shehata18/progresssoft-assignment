## Install MySQL

```bash
sudo apt install mysql-server -y
sudo systemctl enable mysql
sudo systemctl start mysql
sudo systemctl status mysql
```

## Install HAProxy

```bash
sudo apt install haproxy -y
sudo systemctl enable haproxy
sudo systemctl start haproxy
sudo systemctl status haproxy
haproxy -v
```

## Firewall configuration to allow MySQL traffic on port 3306 only.

1- Enable UFW

```bash
sudo ufw enable
```

2- Allow MySQL Port (TCP & UDP)

```bash
sudo ufw allow 3306/tcp
sudo ufw allow 3306/udp
```

3- To Deny Everything else

```bash
sudo ufw defalut deny incoming
sudo ufw default deny outgoing
```

4- Check Status

```bash
sudo ufw status
```


