#!/bin/bash

# Function to display a fancy splash message
function splash_message() {
    echo -e "\033[1;32mWelcome to the bevm installation script by Titus - Noderunners!\033[0m"
    echo -e "\033[1;32mUpdating and upgrading packages...\033[0m"
    echo -e "\033[1;32mInstalling build-essential...\033[0m"
    echo -e "\033[1;32mInstalling curl...\033[0m"
    echo -e "\033[1;32mDownloading and installing Docker...\033[0m"
    echo -e "\033[1;32mCreating storage directory for node...\033[0m"
    echo -e "\033[1;32mPulling the bevm Docker image...\033[0m"
    echo -e "\033[1;32mRunning the bevm Docker container...\033[0m"
}

# Update and upgrade packages
sudo apt update && sudo apt upgrade -y

# Install build-essential
sudo apt-get install -y build-essential

# Install curl
sudo apt-get install -y curl

# Download and install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Create storage directory for node
sudo mkdir -p /var/lib/node_bevm_test_storage

# Pull the bevm Docker image
sudo docker pull btclayer2/bevm:v0.1.1

# Replace "your_node_name" with your metamask address
node_name="your_node_name"

# Run the bevm Docker container
sudo docker run -d -v /var/lib/node_bevm_test_storage:/root/.local/share/bevm btclayer2/bevm:v0.1.1 bevm "--chain=testnet" "--name=$node_name" "--pruning=archive" --telemetry-url "wss://telemetry.bevm.io/submit 0"

# Display the fancy splash message
splash_message
