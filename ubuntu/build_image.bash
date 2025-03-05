PASSWORD=$(openssl rand -base64 10 | tr -d '/+=' | cut -c1-10)
USERNAME=$1

docker build --build-arg SSH_USER=$USERNAME --build-arg PASSWORD=$PASSWORD -t ubuntu-ssh:latest .
docker tag ubuntu-ssh:latest custom/ubuntu-ssh:latest

docker save custom/ubuntu-ssh:latest -o custom-ubuntu.tar
sudo k3s ctr images import custom-ubuntu.tar

# psql -h <postgres_host> -U <postgres_user> -d <postgres_db> -c "INSERT INTO users (username, password) VALUES ('$USERNAME', '$PASSWORD');"
