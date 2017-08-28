require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/artist')
require_relative('../models/album')

get '/404' do
  erb(:"404/index")
end
