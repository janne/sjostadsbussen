require 'patron'
require 'json'

class Trafiklab
  def initialize(api_key)
    @api_key = api_key or raise "API_KEY is missing"
    @sess = Patron::Session.new
    @sess.base_url = "https://api.trafiklab.se/"
  end

  def departures(site_id, line_number = 74)
    response = @sess.get "/sl/realtid/GetDpsDepartures.json?key=#{@api_key}&siteId=#{site_id}&timeWindow=60"
    deps = JSON.parse(response.body)
    deps["DPS"]["Buses"]["DpsBus"].select{|s| s['LineNumber'] == line_number}
  end
end
