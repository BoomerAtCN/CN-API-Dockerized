FROM ubuntu:xenial

#Environment Variables
ENV NODE_EV "development"

# Install all dependencies
RUN apt-get update && apt-get install -y software-properties-common && \ 
    LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    vim \
    git \
    make \
    php7.1 \
    php-curl \
    php-xml \
    php-mbstring \
    libpng-dev \
    zip \
    unzip \
    php-zip \
    php-mysql \
    nodejs \
    npm 

# Copy project files and change working dir
COPY /API-L5.4 /development
WORKDIR /development/API-L5.4

# Install package managers (composer/npm)
# Update npm to the latest stable version
RUN ln -s `which nodejs` /usr/bin/node && \
    npm install -g n && \
    n stable && \
    curl -sS https://getcomposer.org/installer | php -- \
    --install-dir=/usr/bin --filename=composer

# Install npm dependencies
RUN npm install && npm run development

# Host project
CMD composer install && php artisan serve --host 0.0.0.0
