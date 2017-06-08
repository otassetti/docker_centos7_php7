FROM centos:7

#Install Os base
RUN yum makecache fast
RUN yum install -y wget tree vim bash-completion git
RUN wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN wget http://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN rpm -Uvh remi-release-7.rpm epel-release-latest-7.noarch.rpm
RUN yum install -y php71 php71-php-mysql php71-php-curl php71-php-curl php71-php-phar php71-php-zip php71-php-pdo php71-php-xml php71-php-mbstring
RUN ln -s /usr/bin/php71 /usr/bin/php

#Install Composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

