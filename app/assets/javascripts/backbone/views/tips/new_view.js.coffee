Paleospots.Views.Tips ||= {}

class Paleospots.Views.Tips.NewView extends Backbone.View
  template: JST["backbone/templates/tips/new"]

  events:
    "submit #new-tip": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()
    @model.bind("change:errors", @render)

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.set "lat", @$el.find("#lat").val()
    @model.set "long", @$el.find("#long").val()
    @model.set "venue_name", @$el.find("#venue_name").val()
    @model.set "foursquare_id", @$el.find("#foursquare_id").val()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (tip) =>
        @model = tip
        window.location.hash = "/#{@model.id}"

      error: (tip, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: =>
    $(@el).html(@template(@model.toJSON() ))
    @$("form").backboneLink(@model)
    this
