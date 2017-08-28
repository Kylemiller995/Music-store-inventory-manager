require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/album_controller')
require_relative('controllers/artist_controller')
require_relative('controllers/404')
require_relative('models/artist')
require_relative('models/album')

get '/home' do
erb( :index )
end

post '/home' do
  if Album.find_by_name(params["name"]) != nil
    found = Album.find_by_name(params["name"])
    redirect to "/albums/#{found.id}"
  else
    redirect to "/404"
  end

end
