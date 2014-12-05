FROM ubuntu
MAINTAINER Nicolas LAURENT <github@aegypius.com>

# Configure and compile nginx/openresty
RUN apt-get update -qq
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qqy curl
RUN curl -sL https://packagecloud.io/install/repositories/darron/openresty/script.deb | bash
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qqy openresty

# Installs consul-templates
ENV CONSUL_TEMPLATE_VERSION 0.3.1
ENV CONSUL_TEMPLATE_URL https://github.com/hashicorp/consul-template/releases/download/v${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.tar.gz
RUN curl -sL ${CONSUL_TEMPLATE_URL} | tar -C /usr/local/bin --strip-components 1 -zxf -

# Install runit
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qqy --no-install-recommends runit

# Update Config files
# RUN rm -v /etc/nginx/conf.d/*
ADD etc/service /etc/service
ADD etc/consul-template /etc/consul-template
RUN chmod -R +x /etc/service/*/run

CMD ["/usr/bin/runsvdir", "/etc/service"]
