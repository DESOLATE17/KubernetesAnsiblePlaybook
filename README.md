# KubernetesAnsiblePlaybook


First, update your package lists and install Ansible on your control node only or external host:

```shell
sudo apt update -y && sudo apt upgrade -y
sudo apt install ansible -y
```
for testing basic hosts connectivity:
```shell
ansible all -m ping -i inventory/hosts.ini 
```
Basic installation of k8s with apt on each node:
```shell
ansible-playbook -i inventory/hosts.ini  playbooks/k8s-install-basic.yml
```

