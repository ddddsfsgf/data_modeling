-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE first_name
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL
);

CREATE TABLE last_name
(
  id SERIAL PRIMARY KEY,
  last_name TEXT NOT NULL
);

CREATE TABLE seat
(
  id SERIAL PRIMARY KEY,
  seat TEXT NOT NULL
);

CREATE TABLE departure
(
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL
);


CREATE TABLE arrival
(
  id SERIAL PRIMARY KEY,
  arrival TIMESTAMP NOT NULL
);

CREATE TABLE airline
(
  id SERIAL PRIMARY KEY,
  airline TEXT NOT NULL
);

CREATE TABLE from_city
(
  id SERIAL PRIMARY KEY,
  from_city TEXT NOT NULL
);

CREATE TABLE from_country
(
  id SERIAL PRIMARY KEY,
  from_country TEXT NOT NULL
);

CREATE TABLE to_city
(
  id SERIAL PRIMARY KEY,
  to_city TEXT NOT NULL
);

CREATE TABLE to_country
(
  id SERIAL PRIMARY KEY,
  to_country TEXT NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name_id INTEGER REFERENCES first_name ON DELETE CASCADE,
  last_name_id INTEGER REFERENCES last_name ON DELETE CASCADE,
  seat_id INTEGER REFERENCES seat ON DELETE CASCADE,
  departure_id INTEGER REFERENCES departure ON DELETE CASCADE,
  arrival_id INTEGER REFERENCES arrival ON DELETE CASCADE,
  airline_id INTEGER REFERENCES airline ON DELETE CASCADE,
  from_city_id INTEGER REFERENCES from_city ON DELETE CASCADE,
  from_country_id INTEGER REFERENCES from_country ON DELETE CASCADE,
  to_city_id INTEGER REFERENCES to_city ON DELETE CASCADE,
  to_country_id INTEGER REFERENCES to_country ON DELETE CASCADE
);

INSERT INTO first_name
  (first_name)
VALUES
  ('Jennifer'),
  ('Thadeus'),
  ('Sonja'),
  ('Jennifer'),
  ('Waneta'),
  ('Thadeus'),
  ('Berkie'),
  ('Alvin'),
  ('Berkie'),
  ('Cory');

INSERT INTO last_name
  (last_name)
VALUES
  ('Finch'),
  ('Gathercoal'),
  ('Pauley'),
  ('Finch'),
  ('Skeleton'),
  ('Gathercoal'),
  ('Wycliff'),
  ('Leathes'),
  ('Wycliff'),
  ('Squibbes');

INSERT INTO seat
  (seat)
VALUES
  ('33B'),
  ('8A'),
  ('12F'),
  ('20A'),
  ('23D'),
  ('18C'),
  ('9E'),
  ('1A'),
  ('32B'),
  ('10D');

INSERT INTO departure
  (departure)
VALUES
  ('2018-04-08 09:00:00'),
  ('2018-12-19 12:45:00'),
  ('2018-01-02 07:00:00'),
  ('2018-04-15 16:50:00'),
  ('2018-08-01 18:30:00'),
  ('2018-10-31 01:15:00'),
  ('2019-02-06 06:00:00'),
  ('2018-12-22 14:42:00'),
  ('2019-02-06 16:28:00'),
  ('2019-01-20 19:30:00');

INSERT INTO arrival
  (arrival)
VALUES
  ('2018-04-08 12:00:00'),
  ('2018-12-19 16:15:00'),
  ('2018-01-02 08:03:00'),
  ('2018-04-15 21:00:00'),
  ('2018-08-01 21:50:00'),
  ('2018-10-31 12:55:00'),
  ('2019-02-06 07:47:00'),
  ('2018-12-22 15:56:00'),
  ('2019-02-06 19:18:00'),
  ('2019-01-20 22:45:00');

INSERT INTO airline
  (airline)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('Delta'),
  ('TUI Fly Belgium'), 
  ('Air China'),
  ('United'),
  ('American Airlines'),
  ('American Airlines'),
  ('Avianca Brasil');

INSERT INTO from_city
  (from_city)
VALUES
  ('Washingto DC'),
  ('Tokyo'),
  ('Los Angeles'),
  ('Seattle'),
  ('Paris'),
  ('Dubai'),
  ('New York'),
  ('Cedar Rapids'),
  ('Charlotte'),
  ('Sao Paolo');

INSERT INTO from_country
  (from_country)
VALUES
  ('United States'),
  ('Japan'),
  ('United States'),
  ('United States'),
  ('France'),
  ('UAE'),
  ('United States'),
  ('United States'),
  ('United States'),
  ('Brazil');

INSERT INTO to_city
  (to_city)
VALUES
  ('Seattle'),
  ('London'),
  ('Las Vegas'),
  ('Mexico City'),
  ('Casablanca'),
  ('Beijing'),
  ('Charlotte'),
  ('Chicago'),
  ('New Orleans'),
  ('Santiago');

INSERT INTO to_country
  (to_country)
VALUES
  ('United States'),
  ('United Kingdom'),
  ('United States'),
  ('Mexico'),
  ('Morocco'),
  ('China'),
  ('United States'),
  ('United States'),
  ('United States'),
  ('Chile');

INSERT INTO tickets
  (first_name_id, last_name_id, seat_id, departure_id, arrival_id, airline_id, from_city_id, from_country_id, to_city_id, to_country_id)
VALUES
  (1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
  (2, 2, 2, 2, 2, 2, 2, 2, 2, 2),
  (3, 3, 3, 3, 3, 3, 3, 3, 3, 3),
  (4, 4, 4, 4, 4, 4, 4, 4, 4, 4),
  (5, 5, 5, 5, 5, 5, 5, 5 ,5, 5),
  (6, 6, 6, 6, 6, 6, 6, 6 ,6, 6),
  (7, 7, 7 ,7 ,7, 7, 7, 7, 7, 7),
  (8, 8, 8, 8, 8, 8, 8, 8, 8, 8),
  (9, 9, 9, 9, 9, 9, 9, 9, 9, 9),
  (10, 10, 10, 10, 10, 10, 10, 10, 10, 10);