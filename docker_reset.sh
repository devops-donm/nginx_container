#!/bin/bash

# Stop all running containers
echo "Stopping all running containers..."
docker stop $(docker ps -q)

# Remove all containers
echo "Removing all containers..."
docker rm $(docker ps -a -q)

# Remove all images
echo "Removing all images..."
docker rmi $(docker images -q)

# Remove all networks
echo "Removing all networks..."
docker network rm $(docker network ls -q)

# Remove all volumes
echo "Removing all volumes..."
docker volume rm $(docker volume ls -q)

# Perform a full system prune (removes everything including build caches and unused data)
echo "Performing system prune to clean up any remaining resources..."
docker system prune -a --volumes -f

# Optionally, you can uncomment the next lines to purge Docker itself if you want to uninstall Docker.
# echo "Uninstalling Docker and removing all Docker-related files..."
# sudo apt-get purge -y docker-engine docker docker.io docker-ce docker-ce-cli
# sudo apt-get autoremove -y --purge docker-engine docker docker.io docker-ce
# sudo rm -rf /var/lib/docker /etc/docker
# sudo rm -rf /var/run/docker.sock

echo "Docker reset complete!"