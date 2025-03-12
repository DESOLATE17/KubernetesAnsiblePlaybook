# KubernetesAnsiblePlaybook

## Build
Для запуска playbook-ов с `master` ноды нужно поставить `ansible` на мастер-ноду: 

```shell
sudo apt update -y && sudo apt upgrade -y
sudo apt install ansible -y
sudo apt install python3-pip -y
sudo apt install python3-kubernetes
ansible-galaxy collection install community.kubernetes


# for testing basic hosts connectivity:
ansible all -m ping -i inventory.yml 
```
Также нужен `docker`, дока по установке https://docs.docker.com/engine/install/ubuntu/#:~:text=official%20GPG%20key%3A-,sudo%20apt%2Dget%20update,-sudo%20apt%2Dget

Для установки `k3s` в `inventory.yml` вписать пользователей/пароль для доступа по ssh к хостам и запустить `playbook` командой из корня этого репозитория:

```shell
ansible-playbook playbooks/site.yml -i inventory.yml
```
Для установки `helm chart` c guacamole нужно собрать образ контейнера с ubuntu и запустить `playbook`

```shell
cd ubuntu/ 
sudo ./build_image.bash username password # username - имя пользователя для ssh доступа через guacamole web-interface; password - его пароль
cd ..
ansible-playbook playbooks/deploy_guacamole.yml -i inventory.yml
```

После запуска команды, 

## Useful commands 
```shell
 ping iu5-s-1-0.local.bmstu.ru
   
 scp -r   .\KubernetesAnsiblePlaybook\ iu5-s-1-0@iu5-s-1-0.local.bmstu.ru:/home/iu5-s-1-0/

 ssh  iu5-s-1-0@iu5-s-1-0.local.bmstu.ru   

```