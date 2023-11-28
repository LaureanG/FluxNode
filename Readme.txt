Notes:
-mklink /J "C:\Program Files\Docker" "E:\Docker"

-start /w "" "Docker Desktop Installer.exe" install -accept-license  --installation-dir=E:\Docker --wsl-default-data-root=E:\Docker\images

-Start-Process -Wait -FilePath "Docker Desktop Installer.exe" -ArgumentList "install -accept-license --installation-dir=E:\Docker --wsl-default-data-root=E:\Docker\images"
wsl --shutdown

-docker run -d --name docker -v /var/run/docker.sock:/var/run/docker.sock docker:latest
-docker run -d --name docker -v //var/run/docker.sock:/var/run/docker.sock docker:latest

-sudo su -
-sysbench --test=cpu --threads=1 --cpu-max-prime=60000 --time=20 run
-dd if=/dev/zero of=sb-io-test bs=64k count=16k conv=fdatasync; rm -rf sb-io-test
-bash -i <(curl -s https://raw.githubusercontent.com/RunOnFlux/fluxnode-multitool/master/multitoolbox.sh)
-sudo usermod -aG docker node1 (automatically done in step 1 of installer)

Flux Node Info
Flux owner ZelID
1Fxtk6raYLPQi6EwJzijqC3RF2NigLiDp9
Flux Payment Address / Node Address
t1dPMsQGLYYTBtH6TkXUEipEpbjdMKMzFWr
Flux Public Key
0471f7dc2a1864c1dad5f78cbcc9c1041b10e3e0219f830b49b526bccacd4fa4efe79870e20bfce2be9fa9c44535c24317dd2e4a90de612d80dae9388abd649cee
Collateral
ce1634b28ccbcb4e92a6b3ca32a8122657d436276cb978f94fd4263030afe84c
Kadena
k:c71bef5836f4a9e577cfc5cba9701c7df7efabdcab8726a6b466fd058d283a7f

docker stop <container_id_or_name>
docker commit <container_id_or_name> <image_name>:<tag>
docker save -o <path_to_output_file.tar> <image_name>:<tag>
docker load -i <path_to_exported_file.tar>

docker stop affectionate_dubinsk
docker commit affectionate_dubinsky flux-node:01
docker save -o E:\flux-node.tar flux-node:01

Storj
docker run -d --restart unless-stopped --stop-timeout 300 -p 28969:28967/tcp -p 28969:28967/udp -p 14002:14002 -e WALLET="0x3cf69579e8b06814ebaA59f0f0d36a72389C419e" -e EMAIL="lau.rean.gheorghiu@gmail.com" -e ADDRESS="mcstorj1.ddns.net:28969" -e STORAGE="4TB" --mount type=bind,source="E:\\node1\\identity\\storagenode\\",destination=/app/identity --mount type=bind,source="E:\\node1\\data\\",destination=/app/config --name storagenode1 storjlabs/storagenode:latest

Steps:
choco install docker-desktop -y --install-arguments="'--installation-dir=E:\Docker --wsl-default-data-root=E:\Docker\images'"
Re-open terminal
Since Docker folder was created from Admin terminal, give full rights to everyone.
Docker should start succesfully
choco list
Make sure all the programs bellow are installed, using choco install
7zip 23.1.0
7zip.install 23.1.0
chocolatey 2.2.2
chocolatey-compatibility.extension 1.0.0
chocolatey-core.extension 1.4.0
chocolatey-dotnetfx.extension 1.0.1
docker-desktop 4.25.2
dotnetfx 4.8.0.20220524
KB2919355 1.0.20160915
KB2919442 1.0.20160915
kubernetes-cli 1.28.2
kubernetes-kompose 1.31.2
Minikube 1.32.0
skaffold 2.9.0"G:\TV Series\Adela.S02.720p.ANTP.WEB-DL.AAC2.0.x264-playWEB"

Go to work\flux folder and make sure the following dockerfile is present
---
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

# Run flux installer
#bash -i <(curl -s https://raw.githubusercontent.com/RunOnFlux/fluxnode-multitool/master/multitoolbox.sh)

# Switch to the newly created user
USER node1

# Mount the Docker socket from the host, Inception style :D
VOLUME /var/run/docker.sock

# Optionally, you can add CMD or ENTRYPOINT to run certain commands or start services when the container starts
 CMD ["/bin/bash"]
---
docker build -t ubuntu-inception:22.04 .
docker run -it -v /var/run/docker.sock:/var/run/docker.sock ubuntu-inception:22.04
sudo su -
bash -i <(curl -s https://raw.githubusercontent.com/RunOnFlux/fluxnode-multitool/master/multitoolbox.sh)
