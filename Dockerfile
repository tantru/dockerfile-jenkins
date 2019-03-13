FROM dockerhub.hi.inet/dcip/minimal:7
#FROM centos7:latest

# Installing basic package
RUN curl --silent --location https://rpm.nodesource.com/setup_8.x | bash -

RUN yum install -y yum-utils device-mapper-persistent-data lvm2 && yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo &&  yum install -y docker-ce

RUN yum -y install bind-utils which libffi-devel python-pip python-virtualenv python-devel openssh-clients gcc make nodejs gcc-c++ openssl-devel openssl-libs zip unzip jq && yum clean all

RUN yum -y install git && yum clean all

RUN useradd -ms /bin/bash jenkins 

RUN sudo gpasswd -a jenkins docker

RUN sudo gpasswd -a contint docker

RUN sudo gpasswd -a cloud-user docker