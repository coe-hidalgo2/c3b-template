# Step 1: Uninstall old versions of Docker, if any
# This ensures there are no conflicts with existing installations.
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove -y $pkg; done

# Step 2: Update the package database
sudo apt-get update

# Step 3: Install required packages for Docker installation
sudo apt-get install -y ca-certificates curl gnupg lsb-release

# Step 4: Add Docker's official GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Step 5: Set up the Docker stable repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Step 6: Update the package database with Docker packages from the newly added repo
sudo apt-get update

# Step 7: Install Docker Engine, CLI, and Containerd
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Step 8: Add your user to the docker group to manage Docker as a non-root user
sudo groupadd docker
sudo usermod -aG docker $USER

# Apply the new group membership
newgrp docker

# Step 9: Verify Docker installation by checking the version
docker version

# Step 10: Test Docker installation by running a test container
docker run hello-world