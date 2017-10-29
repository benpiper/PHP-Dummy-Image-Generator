FROM php:7.0-apache

RUN apt-get update && \
	apt-get install -y --no-install-recommends \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libpng12-dev \
		libxpm-dev \
		libvpx-dev && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \
	docker-php-ext-configure gd \
		--with-freetype-dir=/usr/lib/x86_64-linux-gnu/ \
		--with-jpeg-dir=/usr/lib/x86_64-linux-gnu/ \
		--with-xpm-dir=/usr/lib/x86_64-linux-gnu/ \
		--with-vpx-dir=/usr/lib/x86_64-linux-gnu/ && \
	docker-php-ext-install \
		gd && \
	a2enmod rewrite

COPY . /var/www/html/