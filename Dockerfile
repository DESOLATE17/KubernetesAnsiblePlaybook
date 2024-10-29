# Используем базовый образ Ubuntu
FROM ubuntu:20.04

# Установка необходимых пакетов
RUN apt-get update && \
    apt-get install -y openssh-server apt-transport-https ca-certificates curl && \
    mkdir /var/run/sshd

# Настройка SSH
RUN echo 'root:password' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN service ssh start

# Открываем порт для SSH
EXPOSE 22

# Команда для запуска SSH-сервиса
CMD ["/usr/sbin/sshd", "-D"]