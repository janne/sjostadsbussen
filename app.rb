require 'sinatra'
require 'yaml'
require './lib/trafiklab'

class App < Sinatra::Base
  get '/' do
    send_file File.join('public', 'index.html')
  end

  get '/departures/:site_id.json' do
    content_type 'application/json'
    trafiklab = Trafiklab.new(ENV['API_KEY'] || YAML.load_file('config/trafiklab.yml')['API_KEY'])
    trafiklab.departures(params[:site_id]).to_json
  end
end
