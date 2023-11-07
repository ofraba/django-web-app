#!/bin/bash

# Check if the container exists
container_id=$(docker ps -aqf name=django-web-app)

if [ -z "$container_id" ]; then
  echo "Container not found."
  exit 1
fi

# Stop the container
docker stop django-web-app

# Remove the container
docker rm django-web-app

echo "Container removed successfully."