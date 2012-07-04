class Foursquare
  def initialize
    client_id = 'HCM5MZ0GBF3BKMZ03DF1LT10T2ECYTMHBGT3A50LT1CLRQS5'
    client_secret = 'K3YF0O2JIK01A3TFIMAV3TIYJXGKOIWDOX0IX5Q2X31AE3BQ'
    @client = Foursquare2::Client.new(client_id: client_id,
                                      client_secret: client_secret)
  end

  def tips(query, lat, long)
     tips = @client.search_tips(:ll => "#{lat},#{long}", :query => query)
     tips.sort!{|t| t.venue['location']['distance']}
     tips.map { |t| { id: 3, text: t.text, venue: t.venue['name'], location: t.venue['location'] }}
  end
end
