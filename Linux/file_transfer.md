## To demonstrate file transfer capabilities, a simulation was performed where a file from the local machine is copied to the virtual machine. While various methods exist, scp (Secure Copy Protocol) is a common command-line tool for secure file transfers over SSH.

From windows terminal or powershell

```bash

scp file.txt shehata@192.168.77.129:/home/shehata/
sftp shehata@192.168.77.129
put file.txt

```

You can use WinSCP GUI at windows and use FTP
