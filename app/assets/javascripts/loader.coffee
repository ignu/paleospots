
loadTips = (position) =>
  lat = position.coords.latitude
  long = position.coords.longitude
  Paleospots.Collections.TipsCollection.url = "/tips/local?lat=#{lat}&long=#{long}&q=paleo"
  Paleospots.Models.Tip.url                 = "/tips/local?lat=#{lat}&long=#{long}&q=paleo"
  tips = new Paleospots.Collections.TipsCollection()
  tips.url = "/tips/local?lat=#{lat}&long=#{long}&q=paleo"
  view = new Paleospots.Views.Tips.IndexView(tips: tips)
  tips.fetch()
  gluten_tips = new Paleospots.Collections.TipsCollection()
  gluten_tips.url = "/tips/local?lat=#{lat}&long=#{long}&q=gluten"
  gluten_tips.bind "reset", () =>
    $.each gluten_tips.models, (index, tip) ->
      tips.add(tip)
  gluten_tips.fetch()
  window.router = new Paleospots.Routers.TipsRouter(tips:tips)
  map = new Paleospots.Views.Tips.GoogleMapView(tips: tips, lat: lat, long: long)
  Backbone.history.start()
  $(".foursquare-tips").append(view.render().el)

$ ->
  navigator.geolocation.getCurrentPosition(loadTips) if navigator.geolocation
