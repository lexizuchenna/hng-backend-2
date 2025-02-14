# Use Ubuntu as base image
FROM ubuntu:22.04

# Install dependencies
RUN apt update && apt install -y python3 python3-pip nginx

# Set working directory
WORKDIR /app

# Copy FastAPI code
COPY . .

# Install Python dependencies
RUN pip install -r requirements.txt

# Copy Nginx config
COPY nginx.conf /etc/nginx/sites-available/default

# Expose ports
EXPOSE 80 8000

# Start Nginx and FastAPI
CMD service nginx start && uvicorn main:app --host 0.0.0.0 --port 8000
