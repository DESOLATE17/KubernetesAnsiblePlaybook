# KubernetesAnsiblePlaybook


Для запуска с master ноды: 

```shell
sudo apt update -y && sudo apt upgrade -y
sudo apt install ansible -y
```
for testing basic hosts connectivity:
```shel
ansible all -m ping -i inventory.yml 
```
