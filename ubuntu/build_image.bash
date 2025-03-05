docker build -t ubuntu-ssh:latest .
docker tag ubuntu-ssh:latest custom/ubuntu-ssh:latest

docker save custom/ubuntu-ssh:latest -o custom-ubuntu.tar
sudo k3s ctr images import custom-ubuntu.tar