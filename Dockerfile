from centos:7

RUN yum install -y https://packages.2600hz.com/centos/7/stable/2600hz-release/4.3/2600hz-release-4.3-0.el7.centos.noarch.rpm

RUN yum install -y kazoo

RUN yum install -y rsyslog python-pip nano vim which net-tools sysvinit-tools passwd sudo git wget openssl

RUN pip install supervisor

COPY files/supervisord.conf supervisord.conf

RUN mkdir -p /var/run/rabbitmq \
    && chown rabbitmq:daemon /var/run/rabbitmq \
    && mkdir -p /var/run/bigcouch \
    && chown bigcouch:daemon /var/run/bigcouch \
    && mkdir -p /var/run/kamailio \
    && chown kamailio:daemon /var/run/kamailio \
    && mkdir -p /var/run/haproxy \
    && chown haproxy:daemon /var/run/haproxy


CMD ["/usr/bin/supervisord"]
