consul = "consul:8500"

template {
  source      = "/etc/consul-template/templates/nginx.conf"
  destination = "/etc/nginx/nginx.conf"
  command     = "sv hup nginx"
}
