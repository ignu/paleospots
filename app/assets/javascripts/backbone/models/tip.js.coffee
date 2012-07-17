class Paleospots.Models.Tip extends Backbone.Model
  url: '/tips'
  paramRoot: 'tip'

  defaults:
    lat: null
    long: null
    venue: null
    url: null
    text: null

class Paleospots.Collections.TipsCollection extends Backbone.Collection
  model: Paleospots.Models.Tip

class Paleospots.Collections.GlutenTipsCollection extends Backbone.Collection
  model: Paleospots.Models.Tip
  url: '/tips'
