require 'sinatra'

get '/' do
  send_file File.join('public', 'index.html')
end

get '/javascripts/application.js' do
  coffee :application
end
