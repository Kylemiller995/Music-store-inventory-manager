require_relative('../models/artist')
require_relative('../models/album')
require('pry-byebug')


Album.delete_all
Artist.delete_all


artist1 = Artist.new({'name' => 'J cole'})
artist1.save

artist2 = Artist.new({'name' => 'Beyonce'})
artist3 = Artist.new({'name' => 'Loyle Carner'})
artist4 = Artist.new({'name' => 'Alabama Shakes'})

artist2.save
artist3.save
artist4.save

album1 = Album.new({
  'name' => 'Forest Hills Drive',
  'genre' => 'Rap',
  'quantity' => 23,
  'buy_price' => 4.00,
  'sell_price' => 14.00,
  'stock_level' => 'high',
  'artist_id' => artist1.id
  })


album2 = Album.new({
  'name' => 'Sound and Colour',
  'genre' => 'Alternate Rock ',
  'quantity' => 10,
  'buy_price' => 5.50,
  'sell_price' => 9.99,
  'stock_level' => 'medium',
  'artist_id' => artist4.id
  })

album3 = Album.new({
  'name' => 'Lemonade',
  'genre' => 'RnB',
  'quantity' => 4,
  'buy_price' => 4.00,
  'sell_price' => 20.00,
  'stock_level' => 'low',
  'artist_id' => artist2.id
  })

album4 = Album.new({
  'name' => 'Yesterdays Gone',
  'genre' => 'rap',
  'quantity' => 200,
  'buy_price' => 8.00,
  'sell_price' => 10.00,
  'stock_level' => 'high',
  'artist_id' => artist3.id
  })

album5 = Album.new({
  'name' => 'Boys and Girls',
  'genre' => 'Alternate Rock',
  'quantity' => 1,
  'buy_price' => 4.00,
  'sell_price' => 9.00,
  'stock_level' => 'low',
  'artist_id' => artist4.id
  })

album1.save
album2.save
album3.save
album4.save
album5.save
binding.pry
nil
