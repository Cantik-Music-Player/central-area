React = require('react')
ReactDOM = require('react-dom')

module.exports.CentralAreaComponent =
class CentralAreaComponent extends React.Component
  constructor: (props) ->
    super props

  render: ->
    <div className="panel panel-default" id="content">
      <div className="panel-body">
        <div className="tab-content">
          {<div key={@props.cantik.utils.normalizeString panel.name} className="tab-pane #{if panel.active then 'active' else ''}"  id={@props.cantik.utils.normalizeString panel.name}></div> for panel in @props.panels}
        </div>
      </div>
    </div>

module.exports.CentralAreaView =
class CentralAreaView
  constructor: (@panels, @cantik) ->
    @element = document.createElement('div')

    ReactDOM.render(
      <CentralAreaComponent panels=@panels cantik=@cantik />,
      @element
    )
    document.getElementsByTagName('body')[0].appendChild(@element);

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element
