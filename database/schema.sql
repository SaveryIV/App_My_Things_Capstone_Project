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

CREATE TABLE musicAlbum (
    id SERIAL PRIMARY KEY,
    title VARCHAR(200),
    artist VARCHAR(200),
    publish_date DATE,
    on_spotify BOOLEAN,
);

CREATE TABLE Genre (
    id SERIAL PRIMARY KEY,
    name VARCHAR(2OO),
    Items INTEGER REFERENCES item(id),
);

CREATE INDEX album_id ON album(id);
CREATE INDEX genre_id ON genre(id);