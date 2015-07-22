{CompositeDisposable} = require 'atom'
{BufferedProcess} = require 'atom'

module.exports = PhpFmt =
    subscriptions: null
    config:
        phpExecutablePath:
            type: 'string'
            default: 'php'
            description: 'the path to the `php` executable'
        executablePath:
            type: 'string'
            default: 'fmt.phar'
            description: 'the path to the `fmt` executable'
        transformations:
            type: 'string'
            default: ''
            description: 'a list of transformations, separated by comma. See <https://github.com/dericofilho/sublime-phpfmt#currently-supported-transformations> for a complete list'


    activate: (state) ->
        # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
        @subscriptions = new CompositeDisposable

        # Register command that toggles this view
        @subscriptions.add atom.commands.add 'atom-workspace', 'php-fmt:transform': => @transform()

    deactivate: ->
        @subscriptions.dispose()

    serialize: ->

    transform: ->
        atom.config.observe 'php-fmt.phpExecutablePath', =>
          @phpExecutablePath = atom.config.get 'php-fmt.phpExecutablePath'

        atom.config.observe 'php-fmt.executablePath', =>
          @executablePath = atom.config.get 'php-fmt.executablePath'

        atom.config.observe 'php-fmt.transformations', =>
          @transformations = atom.config.get 'php-fmt.transformations'

        editor = atom.workspace.getActivePaneItem()

        filePath = editor.getPath() if editor && editor.getPath

        command = @phpExecutablePath

        # options
        args = []
        args.push @executablePath
        args.push '--passes=' + @transformations
        args.push filePath

        # some debug output for a better support feedback
        console.debug('php-fmt Command', command)
        console.debug('php-fmt Arguments', args)

        stdout = (output) -> console.log(output)
        stderr = (output) -> console.error(output)
        exit = (code) -> console.log("#{command} exited with code: #{code}")

        process = new BufferedProcess({
          command: command,
          args: args,
          stdout: stdout,
          stderr: stderr,
          exit: exit
        }) if filePath
