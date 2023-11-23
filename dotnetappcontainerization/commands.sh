# create a new web app named myWebApp in the src folder	
dotnet new webapp -n myWebApp -o src --no-https
# test the app
cd src
dotnet run --urls=http://localhost:5000
# press ctrl+c to stop the app
# create a Dockerfile
# build the image
cd ..
docker build -t mydotnetwebapp .
# view the image
docker images
# tag the image
docker tag mydotnetwebapp:latest mydotnetwebapp:v1.0.0
# view the image
docker images
# remove the tag we created
docker rmi mydotnetwebapp:v1.0.0
# view the image
docker images
# run the image
docker run mydotnetwebapp
# we are not returned to the command prompt. This is because the app is running in the foreground.
# open the browser and navigate to http://localhost:80
# the connection is refused. This is expected because our container is running in isolation which includes networking. Let’s stop the container and restart with port 5000 published on our local network.
# stop the container by pressing ctrl+c
# To publish a port for our container, 
# we’ll use the --publish flag (-p for short) on the docker run command. 
# The format of the --publish command is [host port]:[container port]. 
# So, if we wanted to expose port 80 inside the container to port 5000 outside the container, 
# we would pass 5000:80 to the --publish flag. Run the container using the following command:
docker run -p 5000:80 --name mydotnetwebapp mydotnetwebapp
# open the browser and navigate to http://localhost:5000
# This is great so far, but our sample application is a web server and we don't have to be connected to the container. Docker can run your container in detached mode or in the background. 
# To run the container in detached mode, use the -d flag.
docker run -d -p 5000:80 --name mydotnetwebapp mydotnetwebapp
# open the browser and navigate to http://localhost:5000
