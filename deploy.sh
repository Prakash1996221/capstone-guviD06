#!/bin/bash

# Define variables
IMAGE_NAME="my-image"
TAG="latest"
SERVER_IP="3.91.27.111"
SERVER_USERNAME="reactjs-demo"
SERVER_PATH="/path/to/deploy"

# Push the Docker image to a registry (if needed)
# docker push "$IMAGE_NAME:$TAG"

# SSH into the server and deploy the image
ssh "$SERVER_USERNAME@$SERVER_IP" << EOF
  echo "Deploying Docker image on the server..."

  # Pull the latest image
  docker pull "$IMAGE_NAME:$TAG"

  # Stop and remove the existing container (if any)
  docker stop my-container || true
  docker rm my-container || true

  # Run a new container with the updated image
  docker run -d --name my-container -p 80:80 "$IMAGE_NAME:$TAG"

  echo "Docker image deployed successfully."
EOF
