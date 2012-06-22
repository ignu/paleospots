displayTips = (tips) ->
  $div = $('.gluten')
  $.each tips, (index, tip) ->
    location = tip.location
    $div.append($("<h2>").text(tip.venue))
    $div.append($("<h4>").text(location.address + ", " + location.city + ", " + location.state))
    console.log location
    $div.append($("<div>").text(tip.text))

    loc = new google.maps.LatLng(location.lat, location.lng)
    marker = new google.maps.Marker(
      position: loc
      map: map
      title: tip.venue
      name: tip.venue + ":" + tip.text
    )
    infoWindow = new google.maps.InfoWindow({ maxWidth: 100, zIndex: 9999 })

    google.maps.event.addListener marker, "mouseover", ->
      infoWindow.setContent @name
      infoWindow.open map, this

    google.maps.event.addListener marker, "mouseout", ->
      infoWindow.close()

startZoom = 14
map = undefined
map_markers = {}

init_gmap = (centerLatitude, centerLongitude) ->
  options =
    zoom: startZoom
    center: new google.maps.LatLng(centerLatitude, centerLongitude)
    zoomControl: true
    panControl: true
    mapTypeId: google.maps.MapTypeId.ROADMAP

  map = new google.maps.Map(document.getElementById("gmap"), options)
  infoWindow = new google.maps.InfoWindow(maxWidth: 100)




loadTips = (position) =>
  lat = position.coords.latitude
  long = position.coords.longitude
  init_gmap lat, long
  $.get "/tips/local?lat=#{lat}&long=#{long}&q=paleo", displayTips
  $.get "/tips/local?lat=#{lat}&long=#{long}&q=gluten", displayTips

$ ->
  navigator.geolocation.getCurrentPosition(loadTips) if navigator.geolocation
