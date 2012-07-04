Paleospots.Views.Tips ||= {}

class Paleospots.Views.Tips.IndexView extends Backbone.View
  template: JST["backbone/templates/tips/index"]

  initialize: () ->
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
