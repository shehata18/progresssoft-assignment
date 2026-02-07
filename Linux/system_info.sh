#!/bin/bash

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

echo "===== System Information ====="
echo "Executed By: $(whoami)"
echo "Hostname: $(hostname)"
echo "Server IP: $(hostname -I | awk '{print $1}')"
echo "Public IP: $(curl -s ifconfig.me)"
echo "OS Type and Version: $(lsb_release -d | cut -f2)"
echo "Kernel Version: $(uname -r)"
echo "Architecture: $(uname -m)"
echo "Virtualization: $(systemd-detect-virt)"
echo "Server Time: $(LC_TIME=en_US.UTF-8 date '+%a %b %d %I:%M:%S %p %Z %Y')"
echo "Timezone: $(timedatectl show -p Timezone --value)"
echo "Uptime: $(awk '{print int($1/60) " minutes"}' /proc/uptime)"

echo "===== Resource Usage ====="
echo "Total Memory: $(free -h | awk '/Mem:/ {print $2}')"
echo "Memory Usage: $(free -h | awk '/Mem:/ {print $3 " / " $2}')"
echo "Swap Usage: $(free -h | awk '/Swap:/ {print $3 " / " $2}')"
echo "CPU Cores: $(nproc)"