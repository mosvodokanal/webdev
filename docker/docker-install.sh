#install docker
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum clean all && yum makecache
yum -y install docker-ce
systemctl start docker
systemctl enable docker

#grant use docker to user
usermod -a -G docker safonov

#Install Docker Machine
curl -L https://github.com/docker/machine/releases/download/v0.16.0/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine &&
chmod +x /tmp/docker-machine &&
cp /tmp/docker-machine /usr/local/bin/docker-machine

