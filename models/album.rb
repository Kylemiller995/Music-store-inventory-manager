require_relative('../db/sql_runner')


class Album

  attr_reader(:id)
  attr_accessor(:name, :genre, :quantity, :buy_price, :sell_price, :artist_id, :album_cover_url)

  def initialize(details)
    @id = details['id'].to_i
    @name = details['name']
    @genre = details['genre']
    @quantity = details['quantity'].to_i
    @buy_price = details['buy_price'].to_f
    @sell_price = details['sell_price'].to_f
    @artist_id = details['artist_id'].to_i
    @album_cover_url = details['album_cover_url']
  end

  def save
    sql = "INSERT INTO album (name, genre, quantity, buy_price, sell_price, artist_id, album_cover_url)
    VALUES
    ($1, $2, $3, $4, $5, $6, $7)
    RETURNING id"
    values = [@name, @genre, @quantity, @buy_price, @sell_price, @artist_id, @album_cover_url]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i
  end

  def update
    sql = "UPDATE album SET (name, genre, quantity, buy_price, sell_price, artist_id, album_cover_url)
    =
    ($1, $2, $3, $4, $5, $6, $7)
    WHERE id = $8"
    values = [@name, @genre, @quantity, @buy_price, @sell_price, @artist_id, @album_cover_url, @id]
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

  def stock_level(quantity)
    if quantity.between?(1,19)
      return "Low"
    elsif quantity == 0
      return "Out of Stock"
    elsif quantity.between?(20, 199)
      return "Medium"
    elsif quantity.between?(200, 500)
      return "High"
    else
      return "Undefined"
    end
  end

  def self.find_by_name(name)
    sql = "SELECT * FROM album WHERE name = $1"
    values = [name]
    result = SqlRunner.run(sql, values).first
    album_by_name = Album.new(result) if !result.nil?
    return album_by_name
  end

  def markup(buy_price, sell_price)
    gross_profit = buy_price/sell_price
    result = (gross_profit/buy_price)*100
    return result.round(2)
  end





end
