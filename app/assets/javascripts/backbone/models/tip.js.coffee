class Paleospots.Models.Tip extends Backbone.Model
  paramRoot: 'tip'

  defaults:
    lat: null
    long: null
    venue: null
    url: null
    text: null

class Paleospots.Collections.TipsCollection extends Backbone.Collection
  model: Paleospots.Models.Tip
  url: '/tips'
