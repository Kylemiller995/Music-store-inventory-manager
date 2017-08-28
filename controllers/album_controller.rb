require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/artist')
require_relative('../models/album')
require('pry-byebug')


get '/albums' do
  @albums = Album.all
  @artists = Artist.all
  erb(:"albums/index")
end

get '/albums/new' do
  @albums = Album.all
  @artists= Artist.all
  erb(:"albums/new")
end

post '/albums' do
  if Artist.find_by_name(params["artist_name"]) != nil
    artist = Artist.find_by_name(params["artist_name"])
    album = Album.new(params)
    album.artist_id = artist.id
    album.save
    redirect to '/albums'
  else
    artist = Artist.new(params)
    artist.save
    album = Album.new(params)
    album.artist_id = artist.id
    album.save
    redirect to '/albums'
  end
end

get '/albums/:id' do
  @album = Album.find(params['id'])
  erb(:"albums/show")
end

get '/albums/:id/edit' do
  @artists = Artist.all
  @album = Album.find(params['id'])
  erb(:"albums/edit")
end

post '/albums/:id' do
  album = Album.new(params)
  album.update
  redirect to "/albums/#{params['id']}"
end

post '/albums/:id/delete' do
  album = Album.find(params['id'])
  album.delete
  redirect to '/albums'
end
