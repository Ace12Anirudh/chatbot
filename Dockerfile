# Use an official Nginx image as the base image
FROM nginx:alpine

# Copy your static website files (HTML, CSS, JS) to the Nginx default location
COPY . /usr/share/nginx/html

# Install PHP and necessary extensions
RUN apk add --no-cache php82 php82-fpm php82-opcache php82-pdo php82-pdo_mysql php82-mysqli php82-json php82-curl php82-gd php82-mbstring php82-xml php82-zip

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
