-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  planet_name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL
);

CREATE TABLE orbital 
(
  id SERIAL PRIMARY KEY,
  orbital_name TEXT NOT NULL
);

CREATE TABLE galaxy
(
  id SERIAL PRIMARY KEY,
  galaxy_name TEXT NOT NULL
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  moon_name TEXT NOT NULL
);

CREATE TABLE relationship
(
  id SERIAL PRIMARY KEY,
  planet_id INTEGER REFERENCES planets ON DELETE SET NULL,
  orbital_id INTEGER REFERENCES orbital ON DELETE SET NULL,
  galaxy_id INTEGER REFERENCES galaxy ON DELETE SET NULL,
  moon_id INTEGER REFERENCES moons ON DELETE SET NULL
);

INSERT INTO planets
  (planet_name, orbital_period_in_years)
VALUES
  ('Earth', 1.00),
  ('Mars', 1.88),
  ('Venus', 0.62),
  ('Neptune', 164.8),
  ('Proxima Centauri b', 0.03),
  ('Gliese 876 b', 0.23);

INSERT INTO orbital
  (orbital_name)
VALUES
  ('The Sun'),
  ('Proxima Centauri'),
  ('Gliese 876');

INSERT INTO galaxy
  (galaxy_name)
VALUES 
  ('Milky Way');

INSERT INTO moons
  (moon_name)
VALUES
  ('The Moon'),
  ('Phobos'),
  ('Deimos'),
  ('Naiad'),
  ('Thalassa'),
  ('Despina'), 
  ('Galatea'), 
  ('Larissa'), 
  ('S/2004 N 1'), 
  ('Proteus'), 
  ('Triton'),
  ('Nereid'), 
  ('Halimede'), 
  ('Sao'), 
  ('Laomedeia'), 
  ('Psamathe'), 
  ('Neso');

  INSERT INTO relationship
    (planet_id, orbital_id, galaxy_id, moon_id)
  VALUES
  (1,1,1,1),
  (2,1,1,2),
  (2,1,1,3),
  (3,1,1,NULL),
  (4,1,1,4),
  (4,1,1,5),
  (4,1,1,6),
  (4,1,1,7),
  (4,1,1,8),
  (4,1,1,9),
  (4,1,1,10),
  (4,1,1,11),
  (4,1,1,12),
  (4,1,1,13),
  (4,1,1,14),
  (4,1,1,15),
  (4,1,1,16),
  (4,1,1,17),
  (5,2,1, NULL),
  (6,3,1, NULL);
