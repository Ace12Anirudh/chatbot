# Use an official Nginx image as the base image
FROM nginx:alpine

# Copy your static website files (HTML, CSS, JS) to the Nginx default location
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
