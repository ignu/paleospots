Paleospots.Views.Tips ||= {}

class Paleospots.Views.Tips.GoogleMapView extends Backbone.View
  initialize: () ->
    @options.tips.bind('reset', @render)
    @options.tips.bind('addMarkets', @render)

  addMarkers: =>
    @options.tips.each (tip) =>
      location = tip.attributes.location
      loc = new google.maps.LatLng(location.lat, location.lng)
      marker = new google.maps.Marker(
        position: loc
        map:      @map
        title:    tip.get("venue")
        name:     tip.get("venue") + ": " + tip.get("text")
      )
      infoWindow = new google.maps.InfoWindow({ maxWidth: 100, zIndex: 9999 })

      google.maps.event.addListener marker, "mouseover", ->
        infoWindow.setContent @name
        infoWindow.open @map, this

      google.maps.event.addListener marker, "mouseout", ->
        infoWindow.close()

  render: =>
    map_markers = {}
    lat  = @options.lat
    long = @options.long

    options =
      zoom:        15
      center:      new google.maps.LatLng(lat, long)
      zoomControl: true
      panControl:  true
      mapTypeId: google.maps.MapTypeId.ROADMAP

    @map = new google.maps.Map(document.getElementById("gmap"), options)
    @addMarkers()
    infoWindow = new google.maps.InfoWindow(maxWidth: 100)

