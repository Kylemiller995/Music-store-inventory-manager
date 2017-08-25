require_relative('../db/SqlRunner')


class Artist

  def initialize(details)
    @id = details['id'].to_i
    @name = details["name"]
  end

  def save
    "INSERT INTO artist (name)
    VALUES
    ($1)
    RETURNING id"
    values = [@name]
    artist = SqlRunner.run(sql, values).first
    @id = artist['id'].to_i
  end

  def update
    sql = "UPDATE artist SET (name)
    =
    ($1)
    WHERE id = $5"
    values = [@name]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM artist"
    values = []
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM artist WHERE id
    =
    $1"
    values =[@id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM artist"
    values = []
    artist_details = SqlRunner.run(sql, values)
    artists = map_items(artist_details)
    return artists
  end

  def self.find(id)
    sql = "SELECT * FROM artist WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    artist = Artist.new(result)
  end


  def self.map_items(artist_details)
    return artist_details.map{|artist| Artist.new(artist_details)}
  end

end
