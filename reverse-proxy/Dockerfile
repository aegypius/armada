FROM ubuntu

# Install suypervisor
RUN apt-get -qq update
RUN apt-get -qqy install supervisor
RUN mkdir -p /var/log/supervisor

# Install serf
RUN DEBIAN_FRONTEND=noninteractive apt-get -qqy install ca-certificates unzip wget
RUN wget https://dl.bintray.com/mitchellh/serf/0.6.3_linux_amd64.zip -O /tmp/serf.zip
RUN unzip /tmp/serf.zip -d /usr/local/bin
RUN rm -f /tmp/serf.zip
RUN mkdir -p /etc/serf
EXPOSE 7946

# Install nginx
RUN apt-get -qqy install nginx
EXPOSE 80

# Configuring 
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD serf /etc/serf

CMD ["/usr/bin/supervisord"]
