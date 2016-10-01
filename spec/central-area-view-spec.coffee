CentralAreaView = require('../lib/central-area-view').CentralAreaView
CentralAreaComponent = require('../lib/central-area-view').CentralAreaComponent

assert = require 'assert'
jsdom = require 'mocha-jsdom'

describe "CentralArea Component", ->
  jsdom()

  beforeEach ->
    @centralArea = {panels: [{name: 'test', active: true}, {name: 'test2', active: false}]}

  it "Render", ->
    new CentralAreaView(@centralArea.panels, {
        'utils': {
          normalizeString: (str) ->
            str
        }
    })

    # Clean data-react-id
    html = document.getElementsByTagName("body")[0].innerHTML.replace(/ data-reactroot=""/g, '')

    assert.equal(html,
    '<div><div class="panel panel-default" id="content"><div class="panel-body"><div class="tab-content"><div class="tab-pane active" id="test"></div><div class="tab-pane " id="test2"></div></div></div></div></div>')
