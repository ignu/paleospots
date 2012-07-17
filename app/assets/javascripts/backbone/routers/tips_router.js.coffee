class Paleospots.Routers.TipsRouter extends Backbone.Router
  initialize: (options) ->
    @tips = new Paleospots.Collections.TipsCollection()
    @tips.reset options.tips

  routes:
    "new"      : "newTip"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"       : "index"

  newTip: ->
    @view = new Paleospots.Views.Tips.NewView(collection: @tips)
    $("#gmap").hide()
    $("ul").hide()
    $(".foursquare").hide()
    $(".foursquare-tips button").hide()
    venues_view = new Paleospots.Views.Tips.VenueListView
    $("#tips").html(@view.render().el).show().css({top: '90px'})

  index: ->
    @view = new Paleospots.Views.Tips.IndexView(tips: @tips)
    $("#tips").html(@view.render().el)

  show: (id) ->
    tip = @tips.get(id)

    @view = new Paleospots.Views.Tips.ShowView(model: tip)
    $("#tips").html(@view.render().el)

  edit: (id) ->
    tip = @tips.get(id)

    @view = new Paleospots.Views.Tips.EditView(model: tip)
    $("#tips").html(@view.render().el)
