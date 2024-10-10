FROM nginx:alpine

# Install PHP and necessary extensions
RUN apk add --no-cache php82 php82-fpm php82-opcache php82-pdo php82-pdo_mysql php82-mysqli php82-json php82-curl php82-gd php82-mbstring php82-xml php82-zip

# Create a directory for your PHP application
RUN mkdir /var/www/html/app

# Copy your PHP application code
COPY . /var/www/html/app

# Configure PHP-FPM (same as before)
COPY php-fpm.conf /etc/php82/php-fpm.d/www.conf

# Configure Nginx (slightly modified)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start PHP-FPM and Nginx
CMD ["/usr/bin/php-fpm82", "-F", "-R"] && nginx -g "daemon off;"
