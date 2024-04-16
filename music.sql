-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE title
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL
);

CREATE TABLE duration_in_seconds
(
  id SERIAL PRIMARY KEY,
  duration_in_seconds INTEGER NOT NULL
);

CREATE TABLE release_date
(
  id SERIAL PRIMARY KEY,
  release_date DATE NOT NULL
);

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  artists TEXT NOT NULL
);

CREATE TABLE album
(
  id SERIAL PRIMARY KEY,
  album TEXT NOT NULL
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  producers TEXT NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title_id INTEGER REFERENCES title ON DELETE CASCADE,
  duration_in_seconds_id INTEGER REFERENCES duration_in_seconds ON DELETE CASCADE,
  release_date_id INTEGER REFERENCES release_date ON DELETE CASCADE,
  artists_id INTEGER REFERENCES artists ON DELETE CASCADE,
  album_id INTEGER REFERENCES album ON DELETE CASCADE,
  producers_id INTEGER REFERENCES producers ON DELETE CASCADE
);


INSERT INTO title
  (title)
VALUES
  ('MMMBop'), 
  ('Bohemian Rhapsody'), 
  ('One Sweet Day'), 
  ('Shallow'),
  ('How You Remind Me'),
  ('New York State of Mind'), 
  ('Dark Horse'), 
  ('Moves Like Jagger'),
  ('Complicated'),
  ('Say My Name');

INSERT INTO duration_in_seconds
  (duration_in_seconds)
VALUES
  (238),
  (355), 
  (282), 
  (216), 
  (223), 
  (276), 
  (215), 
  (201), 
  (244), 
  (240);

INSERT INTO release_date
  (release_date)
VALUES
  ('04-15-1997'), 
  ('10-31-1975'),
  ('11-14-1995'),
  ('10-31-1975'), 
  ('08-21-2001'), 
  ('10-20-2009'), 
  ('12-17-2013'), 
  ('06-21-2011'), 
  ('05-14-2002'), 
  ('11-07-1999');

INSERT INTO artists
  (artists)
VALUES
  ('{"Hanson"}'),
  ('{"Queen"}'), 
  ('{"Mariah Cary", "Boyz II Men"}'),
  ('{"Lady Gaga", "Bradley Cooper"}'), 
  ('{"Nickelback"}'),
  ('{"Jay Z", "Alicia Keys"}'),
  ('{"Katy Perry", "Juicy J"}'),
  ('{"Maroon 5", "Christina Aguilera"}'), 
  ('{"Avril Lavigne"}'), 
  ('{"Destiny''s Child"}');

INSERT INTO album
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
  (producers)
VALUES
  ('{"Dust Brothers", "Stephen Lironi"}'),
  ('{"Roy Thomas Baker"}'),
  ('{"Walter Afanasieff"}'),
  ('{"Benjamin Rice"}'),
  ( '{"Rick Parashar"}'),
  ('{"Al Shux"}'),
  ('{"Max Martin", "Cirkut"}'),
  ('{"Shellback", "Benny Blanco"}'),
  ('{"The Matrix"}'),
  ('{"Darkchild"}');

INSERT INTO songs
  (title_id, duration_in_seconds_id, release_date_id, artists_id, album_id, producers_id)
VALUES
  (1, 1, 1, 1, 1, 1),
  (2, 2, 2, 2, 2, 2),
  (3, 3, 3, 3, 3, 3),
  (4, 4, 4, 4, 4, 4),
  (5, 5, 5, 5, 5, 5),
  (6, 6, 6, 6, 6, 6);