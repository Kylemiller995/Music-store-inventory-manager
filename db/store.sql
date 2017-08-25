DROP TABLE album;
DROP TABLE artists;

CREATE TABLE album(
  id SERIAL8 primary key,
  name VARCHAR(225),
  genre VARCHAR(225),
  quantity INT,
  buy_price NUMERIC,
  sell_price NUMERIC,
  stock_level VARCHAR(225),
  artist_id INT8 REFERENCES artist(id)
);

CREATE TABLE artist(
  id SERIAL8 primary key,
  name VARCHAR(225)
);



-- module & mix in (what mike said) can save time
