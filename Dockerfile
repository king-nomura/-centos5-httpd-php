FROM centos:centos5

RUN sed -i 's/mirrorlist=http:\/\/mirrorlist.centos.org/#mirrorlist=http:\/\/mirrorlist.centos.org/g' /etc/yum.repos.d/CentOS-Base.repo && \
    sed -i 's/#baseurl=http:\/\/mirror.centos.org\/centos\/$releasever/baseurl=http:\/\/vault.centos.org\/5.11/g' /etc/yum.repos.d/CentOS-Base.repo  && \
    sed -i 's/mirrorlist=http:\/\/mirrorlist.centos.org/#mirrorlist=http:\/\/mirrorlist.centos.org/g' /etc/yum.repos.d/libselinux.repo && \
    sed -i 's/#baseurl=http:\/\/mirror.centos.org\/centos\/$releasever/baseurl=http:\/\/vault.centos.org\/5.11/g' /etc/yum.repos.d/libselinux.repo  && \
    yum -y install epel-release && \
    yum -y install httpd php53 php53-cli php53-common php53-devel \
        php53-gd php53-imap php53-ldap php53-mbstring php53-mysql php53-odbc64 \
        php53-pdo php53-pgsql php53-snmp php53-xml php53-xmlrpc php53-mcrypt php-pear

CMD ["/usr/sbin/httpd", "-DFOREGROUND"]