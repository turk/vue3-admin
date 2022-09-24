FROM node:14.17-buster as dev

RUN apt update -y && apt upgrade -y
RUN apt install bash git -y
RUN apt install fish -y
RUN npm install -g @vue/cli

# Set the Current Working Directory inside the container
WORKDIR /var/www/html

# copy both 'package.json' and 'package-lock.json' (if available)
COPY package*.json ./

# install project dependencies
RUN npm install

COPY . .

# Expose port 8080 to the outside world
EXPOSE 5173

# Run the executable
#CMD ["npm", "run", "serve"]
