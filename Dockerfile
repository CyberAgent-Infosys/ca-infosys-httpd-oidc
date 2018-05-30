FROM centos:7
RUN yum install -y epel-release && \
    yum install -y httpd && \
    yum install -y https://github.com/zmartzone/mod_auth_openidc/releases/download/v2.3.0/cjose-0.5.1-1.el7.centos.x86_64.rpm && \
    yum install -y https://github.com/zmartzone/mod_auth_openidc/releases/download/v2.3.5/mod_auth_openidc-2.3.5-1.el7.x86_64.rpm
COPY auth_openidc.conf /etc/httpd/conf.d/00-auth_openidc.conf
ENTRYPOINT ["/usr/sbin/httpd", "-DFOREGROUND"]
