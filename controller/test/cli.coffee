describe "Command Line Interface", ->

  describe "global options", ->
    it "should output version when running with --version or -V", (done)->
      done()

    it "should output help when running with --help or -h", (done)->
      done()

  describe "commands", ->

    describe "setup", ->
      it "should output a shell script to be executed on host", (done)->
        done()

    describe "run", ->
      port = process.env.PORT or 3333

      it "should start armada server and listen on #{port}", (done)->
        done()

      it "should handle SIGTERM signal to gracefully close", (done)->
        done()
