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
get '/stylists' do
  @stylists = Stylist.all()
  erb :stylists
end

get '/new_stylist_form' do
  erb :new_stylist_form
end
post '/new_stylist_form' do
  name = params.fetch('new_stylist_name')
  contact = params.fetch('new_stylist_contact')
  stylist = Stylist.new({:name => name, :contact => contact})
  stylist.save()
  @stylists = Stylist.all()
  redirect to '/stylists'
end

get '/stylists/:id' do
  @stylist = Stylist.find(params.fetch('id').to_i())
  erb :stylist
end
delete '/stylists/:id' do
  @stylists = Stylist.all()
  @stylist = Stylist.find(params.fetch('id').to_i())
  @stylist.delete()
  redirect to '/stylists'
end

get '/client' do
  @clients = Client.all()
  erb :client
end
get '/new_client_form' do
  erb :new_client_form
end
post '/new_client_form' do
  name = params.fetch('new_client_name')
  contact = params.fetch('new_client_contact')
  stylist_id = params.fetch('new_client_stylist_id')
  client = Client.new({:name => name, :contact => contact, :stylist_id => stylist_id})
  client.save()
  @clients = Client.all()
  erb :client
end
