
ConditionForm = require './conditionForm'
ConditionList = require './conditionList'

# # # # #

class DefinerForm extends Mn.LayoutView
  className: 'row'
  template: require './templates/definer_form'

  behaviors:
    CancelButton: {}
    SubmitButton: {}
    ModelEvents: {}

  ui:
    addCondition: '[data-click=add]'

  events:
    'click @ui.addCondition': 'addCondition'

  regions:
    conditionsRegion: '[data-region=conditions]'

  addToCollection: (condition) ->
    @collection.add(condition)
    @showConditionList()

  addCondition: ->

    # Instantiates new ConditionModel from the collection
    newCondition = new @collection.model()

    # Instantiates new ConditionForm instance
    conditionForm = new ConditionForm({ model: newCondition, isNew: true })

    # Cancel event callback
    conditionForm.on 'cancel', => @showConditionList()

    # Submit event callback
    conditionForm.on 'submit', (view) => @addToCollection(view.model)

    # Shows the form in region
    @conditionsRegion.show conditionForm

  showConditionList: ->
    @conditionsRegion.show new ConditionList({ collection: @collection })

  onRender: ->
    Backbone.Syphon.deserialize( @, @model.attributes )
    @showConditionList()

  onCancel: ->
    @trigger 'cancel'

  onSubmit: ->
    data = Backbone.Syphon.serialize(@)
    @model.set(data)
    @model.save()

  onRequest: ->
    console.log 'onRequest'

  onSync: ->
    @trigger 'sync', @model

  onError: ->
    console.log 'onError'

# # # # #

module.exports = DefinerForm