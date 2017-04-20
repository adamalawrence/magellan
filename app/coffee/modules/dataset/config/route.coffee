LayoutView  = require './views/layout'

# # # # #

class DatasetConfigRoute extends require 'hn_routing/lib/route'

  # TODO
  title: ->
    return "Datasets - #{@model.get('label')} - Configuration"

  breadcrumbs: ->
    return [
      { href: "#datasets", text: 'Datasets' }
      { href: "#datasets/#{@model.id}", text: @model.get('label') }
      { href: "#datasets/#{@model.id}/search", text: 'Search' }
      { text: 'Configuration' }
    ]

  fetch: (id) ->
    Backbone.Radio.channel('dataset').request('model', id)
    .then (model) => @model = model # Assigns dataset to @model

  render: ->
    @container.show new LayoutView({ model: @model })

# # # # #

module.exports = DatasetConfigRoute
