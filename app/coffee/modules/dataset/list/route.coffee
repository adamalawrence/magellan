LayoutView  = require './views/layout'

# # # # #

class DatasetListRoute extends require 'hn_routing/lib/route'

  title: 'Magellan - Datasets'

  breadcrumbs: [
    { href: '#', text: 'Home' }
    { text: 'Archives' }
  ]

  fetch: ->
    return Backbone.Radio.channel('dataset').request('collection')
    .then (collection) => @collection = collection

  render: ->
    @container.show new LayoutView({ collection: @collection })

# # # # #

module.exports = DatasetListRoute
