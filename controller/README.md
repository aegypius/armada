# armada

This is the core manager of armada. This aim to run API server and provide an
easy way to setup docker containers

## Commands

### setup

  This command is meant to be run from aegypius/armada container with the
  following command :

    docker run -it aegypius/armada setup | sh

  It will pull and run containers required to run armada

### run

  This command start API server and orchestrate services
