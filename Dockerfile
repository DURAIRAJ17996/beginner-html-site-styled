# Use the official Nginx image as the base image
FROM durairajsekar/my_nginx:latest

# Copy your HTML and assets into the default Nginx webroot directory
COPY . /usr/share/nginx/html

# Expose port 80 for HTTP traffic
EXPOSE 80

# Start Nginx when the container is run
CMD ["nginx", "-g", "daemon off;"]
