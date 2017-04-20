LayoutView = require './views/layout'

# # # # #

class DestroyDatasetRoute extends require 'hn_routing/lib/route'

  title: ->
    return "Magellan - #{@model.get('label')} - Destroy"

  breadcrumbs: ->
    return [
      { text: 'Datasets', href: '#datasets' }
      { href: "#datasets/#{@model.id}/search", text: @model.get('label') }
      { text: 'Destroy' }
    ]

  fetch: (id) ->
    Backbone.Radio.channel('dataset').request('model', id)
    .then (model) => @model = model

  render: ->
    @container.show new LayoutView({ model: @model })

# # # # #

module.exports = DestroyDatasetRoute