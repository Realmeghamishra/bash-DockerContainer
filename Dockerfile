FROM ubuntu:latest
MAINTAINER megha

# Add the script to the Docker Image
ADD get_date.sh /root/get_date.sh

# Give execution rights on the cron scripts
RUN chmod 0644 /root/get_date.sh

#Install Cron
RUN apt-get update
RUN apt-get -y install cron

# Add the cron job
RUN crontab -l | { cat; echo "*/30 * * * * bash /root/get_date.sh"; } | crontab -

# Run the command on container startup
CMD cron
