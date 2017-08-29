require_relative('../db/sql_runner')
require_relative('./album.rb')


class Artist

  attr_reader(:id)
  attr_accessor(:artist_name)

  def initialize(details)
    @id = details['id'].to_i
    @artist_name = details['artist_name']
  end

  def save
    sql = "INSERT INTO artist (artist_name)
    VALUES
    ($1)
    RETURNING id"
    values = [@artist_name]
    artist = SqlRunner.run(sql, values)
    id = artist.first['id']
    @id = id.to_i
  end

  def update
    sql = "UPDATE artist SET (artist_name)
    =
    ($1)
    WHERE id = $2"
    values = [@artist_name]
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
    return artist
  end


  def self.map_items(artist_details)
    return artist_details.map{|artist| Artist.new(artist)}
  end

  def self.find_by_name(name)
    sql = "SELECT * FROM artist WHERE artist_name = $1"
    values = [name]
    result = SqlRunner.run(sql, values).first
    artist_by_name = Artist.new(result) if !result.nil?
    return artist_by_name
  end

  def find_albums()
    sql = "SELECT * FROM album WHERE artist_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    albums_found = Album.map_items(result)
    return albums_found
  end






end
