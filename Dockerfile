#PUBLIC BASE IMAGE BEING PULLED FROM REGISTRY
FROM ubuntu:latest

#SWITCHING DIRECTORY TO /opt FOLDER
WORKDIR /opt

# COPYING ALL DIRECTORIES AND FILES FROM LOCAL REPO
COPY . .

#DOWNLOADING AND INSTALLING PRE-REQUISITE BINARIES NECESSARY FOR THE THIS IMAGE TO BE BUILT
RUN apt-get update && apt-get -y install \
python3-pip python3 gunicorn lsof curl nginx supervisor apt-utils && \
apt-get clean && \
rm -rf /var/lib/apt/lists/*

#CREATING AN NGINX SESSION PROFILE
RUN touch /etc/nginx/sites-available/nginx

#COPYING THE NGINX CONFIG FILE TO THIS NGINX DEFAULT PROFILE
COPY nginx /etc/nginx/sites-available/nginx

# DEFINING A SYMLINK BETWEEN THE NGINX SESSION AND THE SITES ENABLED NGINX FOLDER (THIS INTIALIZES THE REVERSE PROXY SESSION INSTANCE)
RUN ln -s /etc/nginx/sites-available/nginx /etc/nginx/sites-enabled/nginx

#INSTALLING THE APPS FROM PYTHON PACKAGE MANAGER PIP
RUN pip3 install --no-cache-dir -r requirements.txt

#REMOVING THE DEFAULT PROFILE (THIS IS DONE TO AVOID PORT CONFLICTS)
RUN rm -rf /etc/nginx/sites-enabled/default

#MAKING THE GUNICORN ACTIVATION BASH SCRIPT EXECUTABLE
RUN chmod +x /opt/ReverseProxy-Start.sh

#CREATING SUPERVISOR DAEMON DIRECTORY AND LOG FILES
RUN mkdir -p /var/log/supervisord && touch /var/log/supervisord/supervisord.log 

#COPYING THE SUPERVISOR CONFIG FILES TO AN EQUIVALENT LOCATION IN THE CONTAINER
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

#RUNNING THE SUPERVISOR CONFIG AS AN ENTRYPOINT TO THE CONTAINER
ENTRYPOINT supervisord -c /etc/supervisor/conf.d/supervisord.conf

#EXPOSING PORT 1212 
EXPOSE 1212

