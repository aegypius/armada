pkg       = require "../package.json"
commander = require "commander"
chalk     = require "chalk"
http      = require "./http"
debug     = (require "debug") "#{pkg.name}:cli"
setup     = require "./setup"

class Command extends commander.Command

  constructor: ->
    super

    @version pkg.version
    @option "--no-color", "Do not colorize output"

    @command "setup"
      .description "setup armada containers"
      .action setup

    @command "run"
      .description "run armada server"
      .action @run

  commandHelp: =>
    return "" unless @commands.length > 0

    commands = @commands.map (cmd)->
      args = cmd._args.map (arg)->
        nameOutput = arg.name + if arg.variadic is true then '..'
        if arg.required then "<#{nameOutput}>" else "[#{nameOutput}]"
      .join "\n"

      command  = [
        cmd._name
        "|#{cmd._alias}" if cmd._alias
        " [options]" if cmd.options.length
        " #{args}" if args
      ].filter (e)->
        return e? and e.trim()
      .join " "

      [
        command
        cmd.description()
      ]

    width = commands.reduce (max, command)->
      Math.max max, command[0].length
    , 0

    [
      chalk.yellow "Commands:"
      (
        commands.map (cmd)->
          len = Math.max 0, width - cmd[0].length
          [
            cmd[0]
            (Array len + 1).join " "
            "  #{cmd[1]}"
          ].join ""
        .join "\n"
        .replace /^/gm , "  "
      )
      ""
    ].join "\n"

  helpInformation: =>
    cmdName = if @_alias then "#{@_name}|#{@_alias}" else @_name

    usage = [
      "#{chalk.green pkg.name} version #{chalk.yellow @version()}"
      ""
      chalk.yellow "Usage:"
      "  #{cmdName} #{@usage()}"
      ""
    ]

    cmds = [@commandHelp()]           if @commandHelp()
    desc = ["  #{@_description}", ""] if @_description
    opts = [
      chalk.yellow "Options:"
      @optionHelp().replace /^/gm, "  "
      ""
      ""
    ]

    return usage
      .concat desc or []
      .concat cmds or []
      .concat opts or []
      .join "\n"

  run: ->
    port = process.env.PORT or 3333
    http.listen port, ->
      debug "listening on http://0.0.0.0:#{port}"


cli = new Command

module.exports         = cli
module.exports.Command = Command
