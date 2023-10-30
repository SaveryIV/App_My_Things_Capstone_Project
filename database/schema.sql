CREATE TABLE books (
    id SERIAL primary key,
	publish_date DATE,
    publisher VARCHAR(50),
    cover_state VARCHAR(50),
    Item_id INTEGER REFERENCES item(id),
)

CREATE TABLE labels (
    id SERIAL primary key,
	title varchar(50),
    color varchar(50)
)

CREATE INDEX books_id ON books(id);
CREATE INDEX item_label_id ON item(id);

CREATE TABLE Authors (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);


CREATE TABLE Games (
  id SERIAL PRIMARY KEY, 
  multiplayer BOOLEAN,                
  last_played_at DATE,               
  genre VARCHAR(255),                
  label VARCHAR(255),                
  publish_date DATE,                 
  archived BOOLEAN,                  
  author_id INT REFERENCES Authors(id) 
);
CREATE INDEX game_id ON game(id);
CREATE INDEX author_id ON author(id);

CREATE TABLE IF NOT EXISTS music_albums (
  id INT GENERATED ALWAYS AS IDENTITY
  on_spotify BOOLEAN NOT NULL,
  genre VARCHAR(100) REFERENCES genres(name),
  author VARCHAR(100) REFERENCES authors(first_name),
  label VARCHAR(100) REFERENCES labels(title),
  publish_date DATE,
  archived BOOLEAN,
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS genres (
  id INT GENERATED ALWAYS AS IDENTITY
  name VARCHAR(100),
  items INT REFERENCES (books, music_albums, games),
  PRIMARY KEY(id, items)
);
