#!/bin/bash

# Define variables
IMAGE_NAME="my-image"
TAG="latest"

# Build the Docker image
docker build -t "$IMAGE_NAME:$TAG" .

# Check if the build was successful
if [ $? -eq 0 ]; then
  echo "Docker image build completed successfully."
else
  echo "Docker image build failed."
fi

