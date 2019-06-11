FROM ubuntu:16.04
MAINTAINER Bryan Rodriguez <email@bryanrodriguez.com>

RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install -y --no-install-recommends \
	qemu \
	qemu-kvm \
	libvirt-bin \
	nginx \
	wget \
	ca-certificates \
	&& update-ca-certificates \
	&& apt-get clean
	
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install -y --no-install-recommends \
	python-paramiko \
	python-pil \
	novnc \
	python-libvirt \
	python-ethtool \
	python-ipaddr \
	python-guestfs \
	libguestfs-tools \
	spice-html5 \
	python-magic \
	keyutils \
	libnfsidmap2 \
	libtirpc1 \
	nfs-common \
	rpcbind \
	python-configobj \
	python-parted
	&& apt-get clean
	
RUN wget https://github.com/kimchi-project/kimchi/releases/download/2.5.0/wok-2.5.0-0.noarch.deb && wget http://kimchi-project.github.io/gingerbase/downloads/latest/ginger-base.noarch.deb && wget https://github.com/kimchi-project/kimchi/releases/download/2.5.0/kimchi-2.5.0-0.noarch.deb

RUN dpkg -i wok-2.5.0-0.noarch.deb && apt-get install -fy --no-install-recommends && \
	dpkg -i ginger-base.noarch.deb && apt-get install -fy --no-install-recommends && \
	dpkg -i kimchi-2.5.0-0.noarch.deb && apt-get install -fy --no-install-recommends
	
ENTRYPOINT ["sh -c"]
CMD []