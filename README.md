# KubernetesAnsiblePlaybook


Для запуска playbook-ов с master ноды нужно поставить ansible на мастер-ноду: 

```shell
sudo apt update -y && sudo apt upgrade -y
sudo apt install ansible -y

# for testing basic hosts connectivity:
ansible all -m ping -i inventory.yml 
```

Для установки k3s в inventory.yml вписать пользователей/пароль для доступа по ssh к хостам и запустить playbook командой из корня этого репозитория:

```shell
ansible-playbook playbooks/site.yml -i inventory.yml
```