# Set up docker's apt repository

# Add Docker's official GPG key:
echo "Add docker to apt..."
sudo apt-get update > /dev/null
sudo apt-get install ca-certificates curl > /dev/null
sudo install -m 0755 -d /etc/apt/keyrings > /dev/null
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc > /dev/null
sudo chmod a+r /etc/apt/keyrings/docker.asc > /dev/null
echo "Done"

# Add the repository to Apt sources:
echo "Add docker to apt sources..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update > /dev/null
echo "Done"

# Install docker
echo "Install docker..."
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin > /dev/null
echo "Done"

