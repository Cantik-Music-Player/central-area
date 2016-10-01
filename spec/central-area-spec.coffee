CentralArea = require '../lib/central-area'
sinon = require 'sinon'
assert = require 'assert'

describe "CentralArea", ->
  beforeEach ->
    @centralArea = new CentralArea({
      'utils': {
        normalizeString: (str) ->
          return str
      },
      'pluginManager': {
        'plugins': {
          'sidebar': {
            'addLink': sinon.spy()
          }
        }
      }
    })
    @centralArea.activate = ->
    @centralArea.centralAreaView = {
      getElement: ->
        {
          querySelector: (q) ->
            'DOM'
        }
      destroy: ->
    }

  it "Initialized", ->
    assert.deepEqual(@centralArea.panels, {})

  it "Add Panel", ->
    element = @centralArea.addPanel('name', 'category', 'sidebarClick', 'sidebarForceActive')

    assert.deepEqual(element, 'DOM')
    assert.deepEqual(@centralArea.panels, [{name: 'name', active: @centralArea.cantik.pluginManager.plugins.sidebar.addLink()}])
    assert(@centralArea.cantik.pluginManager.plugins.sidebar.addLink.calledWith('name', 'category', 'sidebarClick', 'sidebarForceActive'))
