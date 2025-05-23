FROM ubuntu:latest

# Define build argument for the username
ARG SSH_USER=defaultuser
ARG PASSWORD=defaultpass

RUN apt-get update && \
    apt-get install -y openssh-server sudo && \
    mkdir /var/run/sshd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Configure SSH server
RUN echo "HostKey /etc/ssh/ssh_host_ed25519_key" >> /etc/ssh/sshd_config && \
    echo "HostKey /etc/ssh/ssh_host_rsa_key" >> /etc/ssh/sshd_config && \
    echo "HostKey /etc/ssh/ssh_host_ecdsa_key" >> /etc/ssh/sshd_config && \
    echo "HostKeyAlgorithms ssh-ed25519,ssh-rsa,ecdsa-sha2-nistp256" >> /etc/ssh/sshd_config && \
    echo "KexAlgorithms curve25519-sha256,curve25519-sha256@libssh.org,ecdh-sha2-nistp256,ecdh-sha2-nistp384,ecdh-sha2-nistp521,diffie-hellman-group-exchange-sha256" >> /etc/ssh/sshd_config && \
    echo "Ciphers chacha20-poly1305@openssh.com,aes256-gcm@openssh.com,aes128-gcm@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr" >> /etc/ssh/sshd_config && \
    echo "MACs hmac-sha2-512,hmac-sha2-256" >> /etc/ssh/sshd_config

COPY create_user.sh /usr/local/bin/create_user.sh
RUN chmod +x /usr/local/bin/create_user.sh

ENV SSH_USER=$SSH_USER
ENV PASSWORD=$PASSWORD


EXPOSE 22

# Run the script and start SSH service
CMD ["/bin/bash", "-c", "/usr/local/bin/create_user.sh $SSH_USER $PASSWORD && /usr/sbin/sshd -D -e"]
