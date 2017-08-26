require_relative('../db/sql_runner')


class Album

  attr_reader(:id)
  attr_accessor(:name, :genre, :quantity, :buy_price, :sell_price, :stock_level, :artist_id)

  def initialize(details)
    @id = details['id'].to_i
    @name = details['name']
    @genre = details['genre']
    @quantity = details['quantity'].to_i
    @buy_price = details['buy_price'].to_f
    @sell_price = details['sell_price'].to_f
    @stock_level = details['stock_level'] #put stock level method checker here
    @artist_id = details['artist_id'].to_i
  end

  def save
    sql = "INSERT INTO album (name, genre, quantity, buy_price, sell_price, stock_level, artist_id)
    VALUES
    ($1, $2, $3, $4, $5, $6, $7)
    RETURNING id"
    values = [@name, @genre, @quantity, @buy_price, @sell_price, @stock_level, @artist_id,]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i
  end

  def update
    sql = "UPDATE album SET (name, genre, quantity, buy_price, sell_price, stock_level, artist_id)
    =
    ($1, $2, $3, $4, $5, $6, $7)
    WHERE id = $8"
    values = [@name, @genre, @quantity, @buy_price, @sell_price, @stock_level, @artist_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM album"
    values = []
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM album WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM album"
    values = []
    album_data = SqlRunner.run(sql, values)
    albums = map_items(album_data)
    return albums
  end

  def self.find(id)
    sql = "SELECT * FROM album WHERE id = $1"
    values = [id]
    album = SqlRunner.run(sql, values )
    result = Album.new(album.first )
    return result
  end

  def artist
    artist = Artist.find(@artist_id)
    return artist
  end

  def self.map_items(album_details)
    return album_details.map{|album| Album.new(album)}
  end


end
