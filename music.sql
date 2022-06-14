-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL
);

CREATE TABLE release_dates
(
  id SERIAL PRIMARY KEY,
  release DATE NOT NULL
);

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  artist TEXT NOT NULL
);

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  album TEXT NOT NULL
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  producer TEXT NOT NULL
);

CREATE TABLE song_info
(
  id SERIAL PRIMARY KEY,
  song_id INTEGER REFERENCES songs ON DELETE SET NULL,
  release_id INTEGER REFERENCES release_dates ON DELETE SET NULL,
  album_id INTEGER REFERENCES albums ON DELETE SET NULL
);

CREATE TABLE song_artists
(
  id SERIAL PRIMARY KEY,
  song_info_id INTEGER REFERENCES song_info ON DELETE SET NULL,
  artist_id INTEGER REFERENCES artists ON DELETE SET NULL
);

CREATE TABLE song_producers
(
  id SERIAL PRIMARY KEY,
  song_info_id INTEGER REFERENCES song_info ON DELETE SET NULL,
  producer_id INTEGER REFERENCES producers ON DELETE SET NULL
);

INSERT INTO songs
  (title, duration_in_seconds)
VALUES
  ('MMMBop', 238),
  ('Bohemian Rhapsody', 355),
  ('One Sweet Day', 282),
  ('Shallow', 216),
  ('How You Remind Me', 223),
  ('New York State of Mind', 276),
  ('Dark Horse', 215),
  ('Moves Like Jagger', 201),
  ('Complicated', 244),
  ('Say My Name', 240);

INSERT INTO release_dates
  (release)
VALUES
  ('04-15-1997'),
  ('10-31-1975'),
  ('11-14-1995'),
  ('09-27-2018'),
  ('08-21-2001'),
  ('10-20-2009'),
  ('12-17-2013'),
  ('06-21-2011'),
  ('05-14-2002'),
  ('11-07-1999');
  
INSERT INTO artists
  (artist)
VALUES
  ('Hanson'),
  ('Queen'),
  ('Mariah Cary'),
  ('Boyz II Men'),
  ('Lady Gaga'),
  ('Bradley Cooper'),
  ('Nichelback'),
  ('Jay Z'),
  ('Alicia Keys'),
  ('Katy Perry'),
  ('Juicy J'),
  ('Maroon 5'),
  ('Christina Aguilera'),
  ('Avril Lavigne'),
  ('Destiny''s Child');

INSERT INTO albums
  (album)
VALUES
  ('Middle of Nowhere'),
  ('A Night at the Opera'),
  ('Daydream'),
  ('A Star Is Born'),
  ('Silver Side Up'),
  ('The Blueprint 3'),
  ('Prism'),
  ('Hands All Over'),
  ('Let Go'),
  ('The Writing''s on the Wall');

INSERT INTO producers
  (producer)
VALUES
  ('Dust Brothers'),
  ('Stephen Lironi'),
  ('Roy Thomas Baker'),
  ('Walter Afanasieff'),
  ('Benjamin Rice'),
  ('Rick Parashar'),
  ('Al Shux'),
  ('Max Martin'), 
  ('Cirkut'),
  ('Shellback'), 
  ('Benny Blanco'),
  ('The Matrix'),
  ('Darkchild');

INSERT INTO song_info
  (song_id, release_id, album_id)
VALUES
  (1,1,1),
  (2,2,2),
  (3,3,3),
  (4,4,4),
  (5,5,5),
  (6,6,6),
  (7,7,7),
  (8,8,8),
  (9,9,9),
  (10,10,10);

INSERT INTO song_artists
  (song_info_id, artist_id)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (3, 4),
  (4, 5),
  (4, 6),
  (5, 7),
  (6, 8),
  (6, 9),
  (7, 10),
  (7, 11),
  (8, 12),
  (8, 13),
  (9, 14),
  (10, 15);

INSERT INTO song_producers
  (song_info_id, producer_id)
VALUES
  (1, 1),
  (1, 2),
  (2, 3),
  (3, 4),
  (4, 5),
  (5, 6),
  (6, 7),
  (7, 8),
  (7, 9),
  (8, 10),
  (8, 11),
  (9, 12),
  (10, 13);



