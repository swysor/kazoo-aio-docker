from centos/systemd

#RUN yum install -y httpd

RUN yum install -y https://packages.2600hz.com/centos/7/stable/2600hz-release/4.3/2600hz-release-4.3-0.el7.centos.noarch.rpm

RUN yum install -y kazoo

RUN yum install -y rsyslog python-pip nano vim which net-tools sysvinit-tools passwd sudo git wget openssl

RUN yum install -y nginx

RUN echo "systemctl enabling stuff"

RUN systemctl enable rsyslog \
 #   httpd \
    nginx \
    kazoo-ecallmgr \
    kazoo-applications \
    kazoo-haproxy \
    kazoo-bigcouch \
    kazoo-kamailio \
    kazoo-freeswitch \
    kazoo-rabbitmq

COPY files/monster-ui.conf /etc/nginx/conf.d/50_monster-ui.conf
COPY files/nginx.conf /etc/nginx/nginx.conf
COPY files/local.cfg /etc/kazoo/kamailio/local.cfg
COPY files/tls.cfg /etc/kazoo/kamailio/tls.cfg
COPY files/haproxy.cfg /etc/kazoo/haproxy/haproxy.cfg

CMD ["/usr/sbin/init"]
