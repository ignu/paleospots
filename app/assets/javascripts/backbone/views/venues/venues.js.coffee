Paleospots.Views.Models ||= {}
Paleospots.Views.Views  ||= {}

class Paleospots.Models.Venue extends Backbone.Model

class VenueCollection extends Backbone.Collection
  model: Paleospots.Models.Venue
  url: '/venues'

class Paleospots.Views.Tips.VenueListView extends Backbone.View
  tagName: "input"
  initialize: ->
    @collection  =  new VenueCollection()
    @url = "/foursquare_venues?lat=#{lat}&long=#{long}"
    @collection.url = @url
    @collection.fetch()
    @collection.on("reset", @loadVenues)
    @lat    =  lat
    @lat    =  long

  updateVenue: (id) =>
    venue = _.find @results, (venue) ->
      venue.id == id
    console.log venue
    console.log '----'
    $form = $("#new-tip")
    $form.find("#lat").val(venue.location.lat)
    $form.find("#long").val(venue.location.lng)
    $form.find("#foursquare_id").val(venue.id)
    $form.find("#venue_name").val(venue.name)
  loadVenues: =>
    $(@el).attr("type", "hidden").css("width", "400px").css("border", "1px solid red").css("height", "30px")
    attributes = $.map @collection.models, (model) ->
      model.attributes
    format = (item) ->
      item.name
    $(@el).show()
    $("#venue-dropdown").append(@el)
    $(@el).select2
      minimumInputLength: 2
      query: (query) =>
        ajax = $.get("#{@url}&q=#{query.term}")
        ajax.success (response) =>
          @results = response
          response = $.map response, (item) ->
            { id: item.id, text: item.name}
          query.callback
            results: response
            text: (item) ->
              item.name

    $(@el).change (e) =>
      @updateVenue($(@el).val())

