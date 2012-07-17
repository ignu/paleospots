class Foursquare
  def initialize
    client_id = 'HCM5MZ0GBF3BKMZ03DF1LT10T2ECYTMHBGT3A50LT1CLRQS5'
    client_secret = 'K3YF0O2JIK01A3TFIMAV3TIYJXGKOIWDOX0IX5Q2X31AE3BQ'
    @client = Foursquare2::Client.new(client_id: client_id, client_secret: client_secret)
  end

  def venues(lat, long, query ="")
    venues = @client.search_venues(ll: "#{lat}, #{long}", query: query, category_id: category_ids).groups.first.items#.select{|i| i.verified == "false"}
    venues.map { |v| {location: v['location'], name: v["name"], url: v["url"], id: v["id"] } }
  end

  def tips(query, lat, long)
     tips = @client.search_tips(:ll => "#{lat},#{long}", :query => query)
     tips.sort!{|t| t.venue['location']['distance']}
     tips.map { |t| { id: t.id, source: "foursquare.com", url: "http://foursquare.com/item/#{t.id}", text: t.text, venue: t.venue['name'], location: t.venue['location'] }}
  end

  def category_ids
    @category_ids ||= get_category_ids.join(',')
  end

  def get_category_ids
    ids = []
    ids << convenience_store  = "4d954b0ea243a5684a65b473"
    ids << drug_store         = "4bf58dd8d48988d10f951735"
    ids << food_shop          = "4bf58dd8d48988d1f9941735"
    ids << department_store   = "4bf58dd8d48988d1f6941735"
    ids << airport_food_court = "4bf58dd8d48988d1ef931735"
    ids << hotel              = "4bf58dd8d48988d1fa931735"
  end
end
