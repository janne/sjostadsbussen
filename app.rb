require 'sinatra'
require 'coffee-script'
require 'patron'

get '/' do
  send_file File.join('public', 'index.html')
end

get '/departures.json' do
  sess = Patron::Session.new
  siteId = 1366
  key = ENV['API_KEY']
  sess.base_url = "https://api.trafiklab.se/"
  response = sess.get "/sl/realtid/GetDpsDepartures.json?key=#{key}&siteId=#{siteId}&timeWindow=60"
  response.body
end

get '/javascripts/application.js' do
  coffee :application
end
