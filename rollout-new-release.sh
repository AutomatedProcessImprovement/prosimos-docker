echo "### Fetching ..."
sudo git fetch

echo "### Checking out the branch ..."
sudo git checkout main

echo "### Pulling the source code to the checked out branch ..."
sudo sudo git pull

echo "### Restart the api container ..."
sudo docker-compose up -d --no-deps api

echo "### Restart the client container ..."
sudo docker-compose up -d --no-deps client
