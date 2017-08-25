require('sinatra')
require('sinatra/contrib/all')
require_relative('models/student')
require_relative('models/house')


get '/albums' do
  @albums = Album.all
  erb(:index)
end

get '/albums/new' do
  @albums = Album.all
  erb(:new)
end

post '/albums' do
  Album.new(params).save
  redirect to '/albums'
end

get '/albums/:id' do
  @album = Album.find(params['id'])
  erb(:show)
end

get '/albums/:id/edit' do
  @artists = Artist.all
  @album = Album.find(params['id'])
  erb(:edit)
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
