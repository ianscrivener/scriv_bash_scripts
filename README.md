# scriv_bash_scripts

A collection of mostly devops bash scripts...



## For Ubuntu 20.04, 22.04 and 24.04


**Install Docker properly for Production**
```
# run as normal user 
curl -sSL https://raw.githubusercontent.com/ianscrivener/scriv_bash_scripts/main/ubuntu_2x.04/docker_install.sh | bash
```

**Install Docker-Compose**
```
# run as normal user 
curl -sSL https://raw.githubusercontent.com/ianscrivener/scriv_bash_scripts/main/ubuntu_2x.04/docker_compose_install.sh | bash
```


**Install and configure UWF Ubuntu Firewall**

```
# run as normal user  
curl -sSl https://raw.githubusercontent.com/ianscrivener/scriv_bash_scripts/main/ubuntu_2x.04/ufw_install.sh | bash

```

**Add an allowed port to UFW**

```
wget https://raw.githubusercontent.com/ianscrivener/scriv_bash_scripts/main/ubuntu_2x.04/ufw_add_port.sh
sudo ./ufw_add_port.sh 3333
```


**Block a port in UFW**
```
wget https://raw.githubusercontent.com/ianscrivener/scriv_bash_scripts/main/ubuntu_2x.04/ufw_remove_ports.sh
sudo ./ufw_remove_ports.sh 3333 4444 5555
```



**Run ClickHouse in Docker**
```
# run as normal user  
curl -sSl https://raw.githubusercontent.com/ianscrivener/scriv_bash_scripts/main/ubuntu_2x.04/run_clickhouse.sh | bash

sudo ./ufw_add_port.sh 18123    
sudo ./ufw_add_port.sh 19000
```


