#!/bin/bash

# Start the Docker container
docker run -d -p 5000:5000 --name django-web-app django-web-app

# Wait for the container to start
sleep 5

# Check if the container is running
container_status=$(docker inspect -f '{{.State.Running}}' django-web-app)

if [ "$container_status" == "true" ]; then
  echo "Container started successfully."
else
  echo "Failed to start the container."
fi