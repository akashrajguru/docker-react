#bin/bash
# This file is to create new Inage and clear privious build image and run newly build image


#Docker stop angular app 
#sudo docker stop angular_app || true

#Docker remove angular_app
#sudo docker rm  angular_app || true

#Docker remove webapp image 
#sudo docker rmi webapp:latest || true

#Angular app setup
#cd ../webapp

#cd into webapp than Docker build new image
#sudo docker build -t webapp:latest .

# Run newly build image
#sudo docker run -d --restart always --name angular_app -p 80:4201 webapp:latest

#Stop the running frontend_dev_app
sudo docker stop frontend_dev_app || true

#Remove the dev container 
sudo docker rm frontend_dev_app || true

# Remove image to build new image with updated code
sudo docker rmi frontend:dev || true

#Build the dev image
sudo docker build -f Dockerfile.dev . -t frontend:dev

#Run the newly build image
sudo docker run -d -p 3000:3000 --name frontend_dev_app frontend:dev
# sudo docker run --name frontend_dev_app -it frontend:dev npm run test # To attach terminal with running conatiner

# Docker run command with volume mapping 
# sudo docker run -d -p 3000:3000 -v $(pwd):/app --name frontend_dev_app frontend:dev
sudo docker run -d -p 3000:3000 -v /app/node_modules -v $(pwd):/app --name frontend_dev_app frontend:dev

#### Docker command for production app ####

#Stop the running frontend_prod_app
sudo docker stop frontend_prod_app || true

#Remove the prod container 
sudo docker rm frontend_prod_app || true

# Remove image to build new image with updated code
sudo docker rmi frontend:prod || true

# Build production image
sudo docker build . -t frontend:prod

# Run the production image 
sudo docker run -d -p 8080:80 --name frontend_prod_app frontend:prod