# create package.json
npm install
# create a server.js file that defines a web app using the Express.js framework
# create Dockerfile
# ask copilot to Create the Dockerfile for the node.js server
# create a dockerignore file in the same directore as Dockerfile

# build the image
docker build -t <your username>/node-web-app .
# list all images
docker images
# run the image
docker run -p 49160:8080 -d <your username>/node-web-app
# get container ID
docker ps
# Enter the container
docker exec -it <container id> /bin/bash
# go to localhost:49160
