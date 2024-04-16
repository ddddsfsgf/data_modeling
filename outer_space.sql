DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE name
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE orbital_period_in_years
(
  id SERIAL PRIMARY KEY,
  orbital_period_in_years FLOAT NOT NULL
);

CREATE TABLE orbits_around
(
  id SERIAL PRIMARY KEY,
  orbits_around TEXT NOT NULL
);

CREATE TABLE galaxy
(
  id SERIAL PRIMARY KEY,
  galaxy TEXT NOT NULL
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  moons TEXT
);
CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name_id INTEGER REFERENCES name ON DELETE CASCADE,
  orbital_period_in_years_id INTEGER REFERENCES orbital_period_in_years ON DELETE CASCADE,
  orbits_around_id INTEGER REFERENCES orbits_around ON DELETE CASCADE,
  galaxy_id INTEGER REFERENCES galaxy ON DELETE CASCADE,
  moons_id INTEGER REFERENCES moons ON DELETE CASCADE
);

INSERT INTO name
  (name)
VALUES
  ('Earth'),
  ('Mars'),
  ('Venus'),
  ('Neptune'),
  ('Proxima Centauri b'),
  ('Gliese 876 b');

INSERT INTO orbital_period_in_years
  (orbital_period_in_years)
VALUES
  (1.00),
  (1.88),
  (0.62),
  (164.8),
  (0.03),
  (0.23);

INSERT INTO orbits_around
  (orbits_around)
VALUES 
  ('The Sun'),
  ('The Sun'),
  ('The Sun'),
  ('The Sun'), 
  ('Proxima Centauri'), 
  ('Gliese 876');

INSERT INTO galaxy
  (galaxy)
VALUES
  ('Milky Way'),
  ('Milky Way'),
  ('Milky Way'),
  ('Milky Way'), 
  ('Milky Way'), 
  ('Milky Way');

INSERT INTO moons
  (moons)
VALUES
  ('{"The Moon"}'), 
  ('{"Phobos", "Deimos"}'), 
  ('{}'), ('{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('{}'),
  ('{}');

INSERT INTO planets
  (name_id, orbital_period_in_years_id, orbits_around_id, galaxy_id, moons_id)
VALUES
  (1, 1, 1, 1, 1),
  (2, 2, 2, 2, 2),
  (3, 3, 3, 3, 3),
  (4, 4, 4, 4, 4),
  (5, 5, 5, 5, 5);