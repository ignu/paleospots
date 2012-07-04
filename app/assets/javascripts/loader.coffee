
loadTips = (position) =>
  lat = position.coords.latitude
  long = position.coords.longitude
  #init_gmap lat, long
  Paleospots.Collections.TipsCollection.url = "/tips/local?lat=#{lat}&long=#{long}&q=paleo"
  Paleospots.Models.Tip.url = "/tips/local?lat=#{lat}&long=#{long}&q=paleo"
  tips = new Paleospots.Collections.TipsCollection()
  tips.url = "/tips/local?lat=#{lat}&long=#{long}&q=paleo"
  view = new Paleospots.Views.Tips.IndexView(tips: tips)
  tips.fetch()
  window.router = new Paleospots.Routers.TipsRouter(tips:tips)
  Backbone.history.start()
  $(".foursquare-tips").append(view.render().el)

$ ->
  navigator.geolocation.getCurrentPosition(loadTips) if navigator.geolocation

#displayTips = (tips) ->
#  $div = $('.gluten')
#  $.each tips, (index, tip) ->
#    location = tip.location
#    $div.append($("<h2>").text(tip.venue))
#    $div.append($("<h4>").text(location.address + ", " + location.city + ", " + location.state))
#    console.log location
#    $div.append($("<div>").text(tip.text))
#
#    loc = new google.maps.LatLng(location.lat, location.lng)
#    marker = new google.maps.Marker(
#      position: loc
#      map: map
#      title: tip.venue
#      name: tip.venue + ":" + tip.text
#    )
#    infoWindow = new google.maps.InfoWindow({ maxWidth: 100, zIndex: 9999 })
#
#    google.maps.event.addListener marker, "mouseover", ->
#      infoWindow.setContent @name
#      infoWindow.open map, this
#
#    google.maps.event.addListener marker, "mouseout", ->
#      infoWindow.close()
#
#startZoom = 18
#map = undefined
#map_markers = {}
#
#init_gmap = (centerLatitude, centerLongitude) ->
#  options =
#    zoom: startZoom
#    center: new google.maps.LatLng(centerLatitude, centerLongitude)
#    zoomControl: true
#    panControl: true
#    mapTypeId: google.maps.MapTypeId.ROADMAP
#
#  map = new google.maps.Map(document.getElementById("gmap"), options)
#  infoWindow = new google.maps.InfoWindow(maxWidth: 100)


