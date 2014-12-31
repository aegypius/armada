Promise  = require "bluebird"
debug    = (require "debug") "armada:setup"
fs       = Promise.promisifyAll require "fs"
config   = require "../config"
Docker   = require "dockerode"

Promise.longStackTraces()

module.exports = (options)->
  # Try to interact with docker
  new Promise (resolve, reject)->
    {host} = config.docker

    opts = {}
    if /^\//.test host
      opts.socketPath = host
    else
      opts.host = host

    docker = new Docker opts
    docker.info (err, data)->
      if err
        return reject err
      resolve data

  # Check if we are inside a container
  .catch ->
    fs.readFileAsync "/proc/1/cgroup"
      .then (content)->
        /:\/system.slice\/docker-[a-z0-9]+\.scope/gm.exec content
      .then (dockerized)->
        if dockerized
          {host, image} = config.docker
          cmd = [
            "#!/usr/bin/env sh"
            "docker run --volume=#{host}:#{host} -t #{image} setup"
            ""
          ]

          process.stdout.write cmd
          process.exit 0
  .then (data)->
    debug "setting up armada containers"
