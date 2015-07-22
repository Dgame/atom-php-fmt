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
        indentationSpaces:
            type: 'number',
            default: 4,
            description: 'your wanted indentation size (in spaces)'
        useSpaceIndentation:
            type: 'boolean',
            default: 'false',
            description: 'use spaces instead of tabs for indentation'
        level:
            type: 'string'
            enum: ['none', 'psr', 'psr1', 'psr2', 'cakephp']
            default: 'psr2'
            description: 'for example: psr, psr1, psr2 or laravel'
        configFile:
            type: 'string',
            default: '',
            description: 'you can store your configs in a file'
        PSRNaming:
            type: 'boolean',
            default: 'false',
            description: 'activate PSR1 style - Section 3 and 4.3 - Class and method names case.'
        selfUpdate:
            type: 'boolean',
            default: 'false',
            description: 'self-update fmt.phar from Github'
        lintBefore:
            type: 'boolean',
            default: 'false',
            description: 'lint before applying transformations'
        noBackup:
            type: 'boolean',
            default: 'false',
            description: 'Disable the backup functionality'
        visibilityOrder:
            type: 'boolean',
            default: 'false',
            description: 'fixes visibiliy order for method in classes'
        yodaStyle:
            type: 'boolean',
            default: 'false',
            description: 'yoda-style comparisons'
        autoAlign:
            type: 'boolean',
            default: 'false',
            description: 'disable auto align of ST_EQUAL and T_DOUBLE_ARROW'

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

        atom.config.observe 'php-fmt.level', =>
            @level = atom.config.get 'php-fmt.level'

        atom.config.observe 'php-fmt.useSpaceIndentation', =>
          @useSpaceIndentation = atom.config.get 'php-fmt.useSpaceIndentation'

        atom.config.observe 'php-fmt.indentationSpaces', =>
          @indentationSpaces = atom.config.get 'php-fmt.indentationSpaces'

        atom.config.observe 'php-fmt.configFile', =>
          @configFile = atom.config.get 'php-fmt.configFile'

        atom.config.observe 'php-fmt.PSRNaming', =>
          @PSRNaming = atom.config.get 'php-fmt.PSRNaming'

        atom.config.observe 'php-fmt.selfUpdate', =>
          @selfUpdate = atom.config.get 'php-fmt.selfUpdate'

        atom.config.observe 'php-fmt.lintBefore', =>
          @lintBefore = atom.config.get 'php-fmt.lintBefore'

        atom.config.observe 'php-fmt.noBackup', =>
          @noBackup = atom.config.get 'php-fmt.noBackup'

        atom.config.observe 'php-fmt.visibilityOrder', =>
          @visibilityOrder = atom.config.get 'php-fmt.visibilityOrder'

        atom.config.observe 'php-fmt.yodaStyle', =>
          @yodaStyle = atom.config.get 'php-fmt.yodaStyle'

        atom.config.observe 'php-fmt.autoAlign', =>
          @autoAlign = atom.config.get 'php-fmt.autoAlign'

        editor = atom.workspace.getActivePaneItem()

        filePath = editor.getPath() if editor && editor.getPath

        command = @phpExecutablePath

        # options
        args = []
        args.push @executablePath
        args.push '--' + @level if @level and @level != 'none'
        args.push '--indent_with_space=' + @indentationSpaces if @useSpaceIndentation
        args.push '--config=' + @configFile if @configFile.length != 0
        args.push '--psr-naming' if @PSRNaming
        args.push '--selfupdate' if @selfUpdate
        args.push '--lint-before' if @lintBefore
        args.push '--no-backup' if @noBackup
        args.push '--visibility_order' if @visibilityOrder
        args.push '--yoda' if @yodaStyle
        args.push '--enable_auto_align' if @autoAlign
        args.push '--passes=' + @transformations if @transformations.length != 0
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
