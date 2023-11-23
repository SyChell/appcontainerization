# Use an official Node.js runtime as a parent image
FROM node:18

# Set the working directory to /app
WORKDIR /usr/src/app

# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./

# Install any needed packages specified in package.json
RUN npm install

# Bundle app source
COPY . .

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run the server.js file when the container launches
CMD ["node", "server.js"]
