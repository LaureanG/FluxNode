# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Update package lists and install necessary packages
RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release sudo && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update && \
    apt-get install -y docker-ce docker-ce-cli containerd.io && \
    useradd -m -s /bin/bash -p $(openssl passwd -1 Swqa1234) node1 && \
    usermod -aG sudo node1

# Install Sysbench benchmark
RUN curl -s https://packagecloud.io/install/repositories/akopytov/sysbench/script.deb.sh | sudo bash && \
    apt-get install -y sysbench
RUN apt install sysbench -y

# To be runned inside container
# sudo su -
# sysbench --test=cpu --threads=1 --cpu-max-prime=60000 --time=20 run
# dd if=/dev/zero of=sb-io-test bs=64k count=16k conv=fdatasync; rm -rf sb-io-test

# Install prerequisites
# RUN apt-get install curl -y
RUN apt-get install npm -y
RUN apt install -y iproute2
RUN usermod -aG docker node1
# Run flux installer
# bash -i <(curl -s https://raw.githubusercontent.com/RunOnFlux/fluxnode-multitool/master/multitoolbox.sh)

# Switch to the newly created user
USER node1

# Mount the Docker socket from the host, Inception style :D
VOLUME /var/run/docker.sock

# Optionally, you can add CMD or ENTRYPOINT to run certain commands or start services when the container starts
 CMD ["/bin/bash"]