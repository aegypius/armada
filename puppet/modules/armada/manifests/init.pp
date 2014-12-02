class armada {
  Exec {
    path => [
      '/usr/local/bin',
      '/bin',
      '/sbin',
      '/usr/bin',
      '/usr/sbin',
    ],
    timeout => 600
  }

  $sshd = $operatingsystem ? {
    ubuntu  => openssh-server,
    default => ssh
  }

  package { $sshd:
    ensure => installed,
    alias  => sshd
  }

  class { 'docker':
    tcp_bind    => 'tcp://127.0.0.1:2375',
    socket_bind => 'unix://var/run/docker.sock',
  }

  include docker

  docker::image { 'base': }

  include ufw

  ufw::allow { 'allow-ssh':
    port   => 22,
    proto  => tcp
  }

  ufw::allow { 'allow-docker-networking':
    port   => 2357,
    proto  => tcp
  }

}
