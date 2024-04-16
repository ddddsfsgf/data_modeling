DROP DATABASE IF EXISTS  craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE Categories
(
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE Regions 
(
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE Users
(
    id SERIAL PRIMARY KEY,
    encrypted_password TEXT,
    preferred_region_id INTEGER REFERENCES Regions
);

CREATE TABLE Posts
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    text TEXT,
    location TEXT,
    user_id INTEGER REFERENCES Users ON DELETE CASCADE,
    region_id INTEGER REFERENCES Regions ON DELETE CASCADE,
    category_id INTEGER REFERENCES categories ON DELETE CASCADE
);

INSERT INTO Categories
    (name)
VALUES
    ('Housing'),
    ('For sale'),
    ('Jobs'),
    ('Resumes');

INSERT INTO Regions
    (name)
VALUES
    ('San Francisco'),
    ('Atlanta'),
    ('Seattle');

INSERT INTO Users
    (encrypted_password, preferred_region_id)
VALUES
    ('a2gfrg', 2),
    ('xuhfnwe', 1),
    ('ppdqwk3', 3);

INSERT INTO Posts
    (title, text, location, user_id, region_id, category_id)
VALUES
    ('House for sale!', 'Having open house soon!', 'San Francisco', 1, 1, 1),
    ('Help Wanted', 'Looking for chef to work for minimum wage!', 'Near Seattle', 3, 2, 3);