require 'coffee-react/register'
CentralAreaView = require('./central-area-view').CentralAreaView
CentralAreaComponent = require('./central-area-view').CentralAreaComponent

module.exports =
class CentralArea
  constructor: (@cantik) ->
    @panels = []

  activate: (state) ->
    @centralAreaView = new CentralAreaView(@panels, @cantik)

  deactivate: ->
    if @centralAreaView?
      @centralAreaView.destroy()

  serialize: ->
    centralAreaViewState: @centralAreaView.serialize()

  addPanel: (name, category, sidebarClick, sidebarForceActive) ->
    # Add label to sidebar
    active = @cantik.pluginManager.plugins.sidebar.addLink(name, category,
                                                           sidebarClick,
                                                           sidebarForceActive)

    @panels.push({name: name, active: active})

    do @deactivate
    do @activate
    centralArea = @centralAreaView.getElement()

    # Return dom element
    centralArea.querySelector("##{@cantik.utils.normalizeString(name)}")
