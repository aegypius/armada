FROM nginx

# Install suypervisor
RUN apt-get -qq update
RUN DEBIAN_FRONTEND=noninteractive apt-get -qqy install supervisor
RUN mkdir -p /var/log/supervisor

# Install consul-template
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qqy curl
ENV CONSUL_TEMPLATE_VERSION 0.3.1
RUN curl -sL https://github.com/hashicorp/consul-template/releases/download/v${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.tar.gz | tar -C /usr/local/bin --strip-components 1 -zxf -

# Configuring
ADD supervisord.conf /etc/supervisor/conf.d/sites.conf
ADD consul-templates /etc/consul-templates

CMD ["/usr/bin/supervisord"]
