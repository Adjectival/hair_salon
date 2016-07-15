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
get '/new_stylist_form' do
  erb :new_stylist_form
end
post '/new_stylist_form' do
  name = params.fetch('new_stylist_name')
  contact = params.fetch('new_stylist_contact')
  stylist = Stylist.new({:name => name, :contact => contact})
  stylist.save()
  @stylists = Stylist.all()
  erb :stylist
end
get('/delete') do
  @stylists = Stylist.all()
  erb :delete
end
post('/:id/delete') do
  new_stylist = Stylist.new({:id => params.fetch('id')})
  new_stylist.save()
  redirect to '/delete'
end
delete('/:id/delete') do
  stylist = Stylist.find(params.fetch('id').to_i())
  stylist.delete()
  @stylists = Stylist.all()
  redirect to '/stylist'
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
