Docker image based on Ubuntu 16.10 for linkToId

# Build the image from the main directory of this repository,
# because only then will the ADD commands in Dockerfile work correctly:
sudo docker build -t linktoid -f tests/Docker-Ubuntu-17.10/Dockerfile .
