FROM centos:7

#Install Os base
RUN yum makecache fast
RUN yum install -y wget tree vim-enhanced bash-completion git
RUN wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN wget http://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN rpm -Uvh remi-release-7.rpm epel-release-latest-7.noarch.rpm

#Install Php Modules
RUN yum install -y php71 php71-php-cli php71-php-common php71-php-fpm php71-php-mysql \
php71-php-curl php71-php-gd php71-php-phar php71-php-zip php71-php-pdo php71-php-xml \
php71-php-mbstring php71-php-mcrypt php71-php-opcache php71-php-pear \
php71-php-pecl-memcached php71-php-pecl-zip php71-php-soap php71-php-phpiredis php71-php-pecl-redis \
php71-php-pecl-imagick php71-php-yaml php71-php-bcmath

RUN ln -s /usr/bin/php71 /usr/bin/php

#Install Composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

#Create dedicated php-fpm user
RUN groupadd -g 1000 php-fpm
RUN useradd -u 1000 -g 1000 php-fpm
RUN usermod -a -G php-fpm apache
