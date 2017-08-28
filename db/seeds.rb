require_relative('../models/artist')
require_relative('../models/album')
require('pry-byebug')


Album.delete_all
Artist.delete_all


artist1 = Artist.new({'artist_name' => 'J cole'})
artist1.save

artist2 = Artist.new({'artist_name' => 'Beyonce'})
artist3 = Artist.new({'artist_name' => 'Loyle Carner'})
artist4 = Artist.new({'artist_name' => 'Alabama Shakes'})

artist2.save
artist3.save
artist4.save

album1 = Album.new({
  'name' => 'Forest Hills Drive',
  'genre' => 'Rap',
  'quantity' => 92,
  'buy_price' => 4.00,
  'sell_price' => 14.00,
  'artist_id' => artist1.id,
  'album_cover_url' => 'https://upload.wikimedia.org/wikipedia/en/2/2a/2014ForestHillsDrive.jpg'
  })


album2 = Album.new({
  'name' => 'Sound and Colour',
  'genre' => 'Alternate Rock ',
  'quantity' => 56,
  'buy_price' => 5.50,
  'sell_price' => 9.99,
  'artist_id' => artist4.id,
  'album_cover_url' => 'https://images-na.ssl-images-amazon.com/images/I/511Lt1IJgHL.jpg'
  })

album3 = Album.new({
  'name' => 'Lemonade',
  'genre' => 'RnB',
  'quantity' => 4,
  'buy_price' => 4.00,
  'sell_price' => 20.00,
  'artist_id' => artist2.id,
  'album_cover_url' => 'https://upload.wikimedia.org/wikipedia/en/5/53/Beyonce_-_Lemonade_%28Official_Album_Cover%29.png'
  })

album4 = Album.new({
  'name' => 'Yesterdays Gone',
  'genre' => 'rap',
  'quantity' => 199,
  'buy_price' => 8.00,
  'sell_price' => 10.00,
  'artist_id' => artist3.id,
  'album_cover_url' => 'http://diymag.com/media/img/Artists/L/Loyle_Carner/_900x900_crop_center-center_75/loylecarner-yesterdaysgone.png'
  })

album5 = Album.new({
  'name' => 'Boys and Girls',
  'genre' => 'Alternate Rock',
  'quantity' => 140,
  'buy_price' => 4.00,
  'sell_price' => 9.00,
  'artist_id' => artist4.id,
  'album_cover_url' => 'https://truemistersix.files.wordpress.com/2012/07/alabama-shakes-boys-girls-720px.jpg'
  })

album1.save
album2.save
album3.save
album4.save
album5.save
binding.pry
nil
