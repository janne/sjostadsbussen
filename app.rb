require 'sinatra'
require 'coffee-script'
require './lib/trafiklab'

get '/' do
  send_file File.join('public', 'index.html')
end

get '/departures/:site_id.json' do
  content_type 'application/json'
  trafiklab = Trafiklab.new(ENV['API_KEY'])
  trafiklab.departures(params[:site_id]).to_json
end

get '/javascripts/application.js' do
  coffee :application
end
