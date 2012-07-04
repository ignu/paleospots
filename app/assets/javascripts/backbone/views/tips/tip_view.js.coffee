Paleospots.Views.Tips ||= {}

class Paleospots.Views.Tips.TipView extends Backbone.View
  template: JST["backbone/templates/tips/tip"]

  events:
    "click .destroy" : "destroy"

  tagName: "li"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    console.log "RENDERING TIP VIEW", $(@el)
    return this
