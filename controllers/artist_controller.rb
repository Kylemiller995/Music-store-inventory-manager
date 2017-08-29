require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/artist')
require_relative('../models/album')

get '/artists' do
  @artists = Artist.all()
  erb(:"artists/index")
end

get '/artists/new' do
  @artists= Artist.all
  erb(:"artists/new")
end

post '/artists' do
  Artist.new(params).save
  redirect to '/artists'
end

get '/artists/:id' do
  @artist = Artist.find(params['id'])
  erb(:"artists/show")
end

get '/artists/:id/edit' do
  @artists= Artist.find(params['id'])
  erb(:"artists/edit")
end

post '/artists/:id' do
  artist = Artist.new(params)
  artist.update
  redirect to "/artists/#{params['id']}"
end

post '/artists/:id/delete' do
  artist = Artist.find(params['id'])
  artist.delete
  redirect to '/artists'
end
