Paleospots.Views.Tips ||= {}

class Paleospots.Views.Tips.IndexView extends Backbone.View
  template: JST["backbone/templates/tips/index"]
  events:
    "click button" : "new"

  new: =>
    router.navigate "#new", { trigger: true }

  initialize: () ->
    @options.tips.bind('add', @addOne)
    @options.tips.bind('reset', @addAll)

  addAll: () =>
    @options.tips.each(@addOne)

  addOne: (tip) =>
    view = new Paleospots.Views.Tips.TipView({model : tip})
    @$("ul").append(view.render().el)

  render: =>
    $(@el).html(@template(tips: @options.tips.toJSON() ))
    @addAll()

    return this
