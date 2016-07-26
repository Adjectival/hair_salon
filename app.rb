require 'PG'
require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/stylist'
require './lib/client'
require 'pry'
DB = PG.connect({:dbname => 'hair_salon'})

get '/' do
  erb :index
end
get '/stylists' do
  @stylists = Stylist.all()
  erb :stylists
end

get '/clients' do
  @clients = Client.all()
  @stylists = Stylist.all()
  erb :clients
end

get '/stylists/new' do
  erb :new_stylist_form
end

post '/stylists/new' do
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

post '/find_clients_by_stylist' do
  stylist = Stylist.find(params.fetch("find_by_stylist_id").to_i)
  @found_clients = stylist.clients()
  erb :found_clients
end

get '/clients/new' do
  @clients = Client.all()
  @stylists = Stylist.all()
  erb :new_client_form
end

post '/clients/new' do
  name = params.fetch('new_client_name')
  contact = params.fetch('new_client_contact')
  stylist_id = params.fetch('new_client_stylist_id')
  client = Client.new({:name => name, :contact => contact, :stylist_id => stylist_id})
  client.save()
  @clients = Client.all()
  @stylists = Stylist.all()
  erb :clients
end

get '/clients/:id' do
  @client = Client.find(params.fetch('id').to_i())
  @stylist = Stylist.find(@client.stylist_id().to_i)
  erb :client
end

delete '/clients/:id' do
  @clients = Client.all()
  @client = Client.find(params.fetch('id').to_i())
  @client.delete()
  redirect to '/clients'
end

get '/stylists/:id/edit' do
  @stylists = Stylist.all()
  @stylist = Stylist.find(params.fetch('id').to_i())
  erb :update_stylist_form
end

patch '/stylists/:id' do
  @stylists = Stylist.all()
  @stylist = Stylist.find(params.fetch('id').to_i())
  name = params.fetch('name')
  contact = params.fetch('contact')
  @stylist.update({:name => name, :contact => contact})
  redirect to '/stylists'
end

get '/clients/:id/edit' do
  @client = Client.find(params.fetch('id').to_i())
  @stylists = Stylist.all()
  erb :update_client_form
end

patch '/clients/:id' do
  @client = Client.find(params.fetch('id').to_i())
  @stylist = Stylist.find(params.fetch('id').to_i())
  name = params.fetch('name')
  contact = params.fetch('contact')
  stylist_id = params.fetch('update_stylist_id')
  @client.update({:name => name, :contact => contact, :stylist_id => stylist_id})
  redirect to '/clients'
end
