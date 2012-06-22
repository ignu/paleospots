displayTips = (tips) ->
  $div = $('.gluten')
  $.each tips, (index, tip) ->
    $div.append($("<h2>").text(tip.venue))
    $div.append($("<h4>").text(tip.location.address + ", " + tip.location.city))
    $div.append($("<div>").text(tip.text))

loadTips = (position) =>
  lat = position.coords.latitude
  long = position.coords.longitude
  $.get "/tips/local?lat=#{lat}&long=#{long}&q=paleo", displayTips
  $.get "/tips/local?lat=#{lat}&long=#{long}&q=gluten", displayTips

navigator.geolocation.getCurrentPosition(loadTips) if navigator.geolocation
