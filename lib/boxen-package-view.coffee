{View} = require 'atom'

module.exports =
class BoxenPackageView extends View
  @content: ->
    @div class: 'boxen-package overlay from-top', =>
      @div "The BoxenPackage package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "boxen-package:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "BoxenPackageView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
