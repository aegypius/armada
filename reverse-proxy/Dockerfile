FROM nginx

# Update sources lists
RUN apt-get update -qq

# Install runit
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qqy --no-install-recommends runit

# Install consul-template
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qqy curl
ENV CONSUL_TEMPLATE_VERSION 0.3.1
RUN curl -sL https://github.com/hashicorp/consul-template/releases/download/v${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.tar.gz | tar -C /usr/local/bin --strip-components 1 -zxf -

# Configuring
ADD etc/service /etc/service
RUN chmod -R +x /etc/service/*
ADD etc/consul-templates /etc/consul-templates
RUN rm -v /etc/nginx/conf.d/*

CMD ["/usr/bin/runsvdir", "/etc/service"]
