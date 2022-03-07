#/bin/bash

# Moves the service file to systemd dir
sudo mv docker_manager.service /etc/systemd/system/

# Starts and enables the service
sudo systemctl start docker_manager.service
sudo systemctl enable docker_manager.service