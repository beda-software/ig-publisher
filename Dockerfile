# Use Alpine Linux as the base image
FROM alpine:latest

# Set the working directory
WORKDIR /home/node

# Make ports available outside this container
EXPOSE 80 4000

# To avoid - ERROR: Unable to lock database: Permission denied
USER root

# Install Node.js and npm
RUN apk add --update nodejs-current npm
RUN addgroup -S node && adduser -S node -G node

# Install application dependencies
RUN apk update npm install

# Install Java
RUN apk add openjdk11

# Required by IG Publisher
RUN apk add ttf-dejavu

# Just in case - Text User Interface (TUI) 
RUN apk add --update-cache ncurses

# Midnight Commander
RUN apk add mc

# Required by IG Publisher
RUN apk --no-cache add curl

# Replace ash with bash
RUN apk add --update-cache bash

# Install or update SUSHI
RUN npm install -g fsh-sushi

# Instll Jekyll
RUN apk upgrade --update \
 && apk add libatomic readline readline-dev libxml2 libxml2-dev \
        ncurses-terminfo-base ncurses-terminfo \
        libxslt libxslt-dev zlib-dev zlib \
        ruby ruby-dev yaml yaml-dev \
        libffi-dev build-base git nodejs \
        ruby-io-console ruby-irb ruby-json ruby-rake \
 && gem install --no-document redcarpet kramdown maruku rdiscount RedCloth liquid pygments.rb \
 && gem install --no-document sass safe_yaml \        
 && gem install --no-document jekyll -v 2.5 \
 && gem install --no-document jekyll-paginate jekyll-sass-converter \
 && gem install --no-document jekyll-sitemap jekyll-feed jekyll-redirect-from \
 && rm -rf /root/src /tmp/* /usr/share/man /var/cache/apk/* \
 && apk del build-base zlib-dev ruby-dev readline-dev \
            yaml-dev libffi-dev libxml2-dev \
 && apk search --update

# Specify the command to run when the container starts
CMD ["node", ""]
