class LinuxCommands {
  LinuxCommands._();

  static final List<Map<String, dynamic>> modules = [

    {
      "title": "System Health",
      "icon": "health",
      "command": "uptime",
      "output": """
\$ uptime

10:42:16 up 24 days, 3:14,
3 users,
load average: 0.42, 0.31, 0.18

\$ free -h

Memory:
Total: 16 GB
Used : 6.2 GB
Free : 8.9 GB
Available : 9.8 GB

\$ df -h

Filesystem      Size Used Avail Use%
/dev/sda1       120G  45G   69G  39%

✔ System Healthy
"""
    },

    {
      "title": "Service Management",
      "icon": "service",
      "command": "systemctl status nginx",
      "output": """
● nginx.service

Loaded: loaded
Active: active (running)

Main PID : 1256

Memory : 35 MB

CPU : 0.6 %

Tasks : 4

✔ Service Running Successfully
"""
    },

    {
      "title": "System Logs",
      "icon": "logs",
      "command": "journalctl -xe",
      "output": """
Jul 29 Login Success

Jul 29 SSH Connected

Jul 29 Backup Completed

Jul 29 Failed Login Attempt

Jul 29 Service Restarted

Critical Errors : 0

Warnings : 1

Healthy
"""
    },

    {
      "title": "User Management",
      "icon": "users",
      "command": "cat /etc/passwd",
      "output": """
root:x:0:0

ubuntu:x:1000:1000

developer:x:1001:1001

admin:x:1002:1002

Total Users : 4
"""
    },

    {
      "title": "Password Policy",
      "icon": "password",
      "command": "chage -l admin",
      "output": """
Password expires : Never

Minimum Days : 0

Maximum Days : 90

Warning : 7 Days

Policy Status

✔ Secure
"""
    },

    {
      "title": "Firewall",
      "icon": "firewall",
      "command": "ufw status verbose",
      "output": """
Status : active

22 SSH Allow

80 HTTP Allow

443 HTTPS Allow

Firewall Enabled

No Threats
"""
    },

    {
      "title": "Network Diagnostics",
      "icon": "network",
      "command": "ip addr",
      "output": """
eth0

192.168.1.101

Gateway

192.168.1.1

DNS

8.8.8.8

Latency

12 ms

✔ Connected
"""
    },

    {
      "title": "Backup Verification",
      "icon": "backup",
      "command": "ls -lh /backup",
      "output": """
backup.tar.gz

24 GB

Created

29 Jul 2026

Verified

✔ Success
"""
    },

    {
      "title": "VM Health",
      "icon": "vm",
      "command": "virsh list",
      "output": """
Id Name State

1 Web-Server Running

2 DB-Server Running

3 Jenkins Running

✔ All Virtual Machines Healthy
"""
    },

    {
      "title": "Security Audit",
      "icon": "audit",
      "command": "fail2ban-client status",
      "output": """
Protected Services

SSH

NGINX

Failed Login

1

Blocked IP

0

Security Status

Excellent
"""
    },

    {
      "title": "Docker",
      "icon": "docker",
      "command": "docker ps",
      "output": """
CONTAINER ID

nginx

redis

mysql

jenkins

Running Containers

4
"""
    },

    {
      "title": "Kubernetes",
      "icon": "kubernetes",
      "command": "kubectl get pods",
      "output": """
NAME

nginx

mysql

redis

grafana

STATUS

Running

4/4 Healthy
"""
    }
  ];
}