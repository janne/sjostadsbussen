require 'sinatra'
require 'coffee-script'
require './lib/trafiklab'

get '/' do
  send_file File.join('public', 'index.html')
end

get '/departures.json' do
  trafiklab = Trafiklab.new(ENV['API_KEY'])
  trafiklab.departures(1366).to_json
end

get '/javascripts/application.js' do
  coffee :application
end
