-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE Customers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT,
  last_name TEXT NOT NULL
);

CREATE TABLE Flights
(
  id SERIAL PRIMARY KEY,
  airline TEXT NOT NULL
);

CREATE TABLE Seats
(
  id SERIAL PRIMARY KEY,
  seat TEXT NOT NULL
);

CREATE TABLE City
(
  id SERIAL PRIMARY KEY,
  city TEXT NOT NULL
);

CREATE TABLE Country 
(
  id SERIAL PRIMARY KEY,
  country TEXT NOT NULL
);

CREATE TABLE Tickets
(
  id SERIAL PRIMARY KEY,
  customer_id INTEGER REFERENCES Customers,
  flight_id INTEGER REFERENCES Flights,
  seat_id INTEGER REFERENCES Seats,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  from_city_id INTEGER REFERENCES City,
  from_country_id INTEGER REFERENCES Country,
  to_city_id INTEGER REFERENCES City,
  to_country_id INTEGER REFERENCES Country
);


INSERT INTO Customers
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoa'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');
  
INSERT INTO Flights
  (airline)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');

INSERT INTO Seats
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

INSERT INTO City
  (city)
VALUES
  ('Washington DC'),
  ('Seattle'),
  ('Tokyo'),
  ('London'),
  ('Los Angeles'),
  ('Las Vegas'),
  ('Mexico City'),
  ('Paris'),
  ('Casablanca'),
  ('Dubai'),
  ('Beijing'),
  ('New York'),
  ('Charlotte'),
  ('Cedar Rapids'),
  ('Chicago'),
  ('New Orleans'),
  ('Sao Paolo'), 
  ('Santiago');

INSERT INTO Country
  (country)
VALUES
  ('United States'), 
  ('Japan'), 
  ('United Kingdom'),
  ('Mexico'),
  ('France'), 
  ('Morocco'),
  ('UAE'),
  ('China'),
  ('Brazil'),
  ('Chile');

INSERT INTO Tickets
  (customer_id, flight_id, seat_id, departure, arrival, from_city_id, from_country_id, to_city_id, to_country_id)
VALUES
  (1, 1, 1, '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 2, 1),
  (2, 2, 2, '2018-12-19 12:45:00', '2018-12-19 16:15:00', 3, 2, 4, 3),
  (3, 3, 3, '2018-01-02 07:00:00', '2018-01-02 08:03:00', 5, 1, 6, 1),
  (1, 4, 4, '2018-04-15 16:50:00', '2018-04-15 21:00:00', 2, 1, 7, 4),
  (4, 5, 5, '2018-08-01 18:30:00', '2018-08-01 21:50:00', 8, 5, 9, 6),
  (2, 6, 6, '2018-10-31 01:15:00', '2018-10-31 12:55:00', 10, 7, 11, 8),
  (5, 1, 7, '2019-02-06 06:00:00', '2019-02-06 07:47:00', 12, 1, 13, 1),
  (6, 6, 8, '2018-12-22 14:42:00', '2018-12-22 15:56:00', 14, 1, 15, 1),
  (5, 6, 9, '2019-02-06 16:28:00', '2019-02-06 19:18:00', 13, 1, 16, 1),
  (7, 7, 10, '2019-01-20 19:30:00', '2019-01-20 22:45:00', 17, 9, 18, 10)

  
  
  
  

  