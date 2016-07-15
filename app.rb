require 'PG'
require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/stylist'
require './lib/client'
require 'pry'
DB = PG.connect({:dbname => 'hair_salon_test'})

get '/' do
  erb :index
end
get '/stylist' do
  @stylists = Stylist.all()
  erb :stylist
end
get '/client' do
  @clients = Client.all()
  erb :client
end
