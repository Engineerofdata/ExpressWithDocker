# The official Alpine image as the base image
FROM alpine:latest

#Pulling the latest version of nodejs and npm
RUN apk update && apk upgrade
RUN apk add sqlite
RUN apk add nodejs npm

# Set the working directory in the container
COPY /app /src/

WORKDIR /src

# Install the dependencies
RUN npm install
RUN npm install sqlite3
RUN chmod +x commands.sh

CMD ["/bin/sh","-c","./commands.sh"]




