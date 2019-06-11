FROM ubuntu:16.04
MAINTAINER Bryan Rodriguez <email@bryanrodriguez.com>

RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install -y --no-install-recommends \
	qemu \
	qemu-kvm \
	libvirt-bin \
	nginx \
	wget \
	&& apt-get clean
	
RUN wget https://github.com/kimchi-project/kimchi/releases/download/2.5.0/wok-2.5.0-0.noarch.deb && wget http://kimchi-project.github.io/gingerbase/downloads/latest/ginger-base.noarch.deb && wget https://github.com/kimchi-project/kimchi/releases/download/2.5.0/kimchi-2.5.0-0.noarch.deb

RUN dpkg -i wok-2.5.0-0.noarch.deb && apt-get install -fy --no-install-recommends && \
	dpkg -i ginger-base.noarch.deb && apt-get install -fy --no-install-recommends && \
	dpkg -i kimchi-2.5.0-0.noarch.deb && apt-get install -fy --no-install-recommends
	
ENTRYPOINT ["dumb-init"]
CMD []