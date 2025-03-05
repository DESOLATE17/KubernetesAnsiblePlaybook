# KubernetesAnsiblePlaybook


Для запуска playbook-ов с master ноды нужно поставить ansible на мастер-ноду: 

```shell
sudo apt update -y && sudo apt upgrade -y
sudo apt install ansible -y
sudo apt install python3-pip -y
sudo apt install python3-kubernetes
ansible-galaxy collection install community.kubernetes


# for testing basic hosts connectivity:
ansible all -m ping -i inventory.yml 
```

Для установки k3s в inventory.yml вписать пользователей/пароль для доступа по ssh к хостам и запустить playbook командой из корня этого репозитория:

```shell
ansible-playbook playbooks/site.yml -i inventory.yml
```

```shell
 ping iu5-s-1-0.local.bmstu.ru

 scp -r .\k3s-ansible\ansible.cfg iu5-s-1-0@iu5-s-1-0.local.bmstu.ru:/home/iu5-s-1-0/    
 scp -r   .\KubernetesAnsiblePlaybook\ iu5-s-1-0@iu5-s-1-0.local.bmstu.ru:/home/iu5-s-1-0/

ssh  iu5-s-1-0@iu5-s-1-0.local.bmstu.ru   

```