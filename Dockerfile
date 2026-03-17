# The official Alpine image as the base image
FROM node:latest

#Pulling the latest version of nodejs and npm
RUN apt update && apt upgrade -y 
RUN apt install -y sqlite3


# Set the working directory in the container
COPY /app /src/

WORKDIR /src

# Install the dependencies
RUN npm install
RUN npm install better-sqlite3
RUN chmod +x commands.sh

CMD ["/bin/bash","-c","./commands.sh"]




