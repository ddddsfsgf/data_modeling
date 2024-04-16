DROP DATABASE IF EXISTS  soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE Season
(
    id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

CREATE TABLE Referees
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE Teams
(
    id SERIAL PRIMARY KEY,
    name TEXT,
    city TEXT
);

CREATE TABLE Players
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    birthday DATE,
    height DECIMAL,
    current_team_id INTEGER REFERENCES Teams ON DELETE CASCADE
);

CREATE TABLE Matches
(
    id SERIAL PRIMARY KEY,
    home_team_id INTEGER REFERENCES Teams ON DELETE CASCADE,
    away_team_id INTEGER REFERENCES Teams ON DELETE CASCADE,
    location TEXT,
    date DATE,
    start_time INTEGER,
    season_id INTEGER REFERENCES Season ON DELETE CASCADE,
    referee_id INTEGER REFERENCES Referees ON DELETE CASCADE
);

CREATE TABLE Goals
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES Players ON DELETE CASCADE,
    match_id INTEGER REFERENCES Matches ON DELETE CASCADE
);

CREATE TABLE Results
(
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES Teams ON DELETE CASCADE,
    match_id INTEGER REFERENCES Matches ON DELETE CASCADE,
    result TEXT
);

CREATE TABLE Lineups
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES Players ON DELETE CASCADE,
    match_id INTEGER REFERENCES Matches ON DELETE CASCADE,
    team_id INTEGER REFERENCES Teams ON DELETE CASCADE
);

INSERT INTO Season
    (start_date, end_date)
VALUES
    ('2022-02-04', '2022-12-20'),
    ('2023-02-07', '2023-12-22');

INSERT INTO Referees
    (name)
VALUES
    ('Head referee'),
    ('Assistant referee 1'),
    ('Assistant referee 2');

INSERT INTO Teams
    (name, city)
VALUES
    ('Tigers', 'Chicago'),
    ('Sponges', 'Tampa Bay'),
    ('Daredevils', 'Seattle'),
    ('Bankers', 'Pittsburgh');

INSERT INTO Players
    (name, birthday, height, current_team_id)
VALUES
    ('Jake Hiton', '1999-04-13', 5.9, 1),
    ('Mike Kennedy', '2000-07-03', 5.7, 2),
    ('Bob Bass', '1999-10-18', 5.7, 3),
    ('Oscar Logan', '2001-02-16', 5.8, 4);

INSERT INTO Matches
    (home_team_id, away_team_id, location, date, start_time, season_id, referee_id)
VALUES
    (1, 3, 'Chicago', '2023-07-17', 1300, 1, 2),
    (4, 2, 'Pittsburgh', '2022-10-14', 1700, 2, 3);

INSERT INTO Goals
    (player_id, match_id)
VALUES
    (1, 4),
    (2, 3),
    (4, 4),
    (3, 1);

INSERT INTO Results
    (team_id, match_id, result)
VALUES
    (1, 1, 'Win'),
    (2, 2, 'Draw'),
    (3, 1, 'Lose');

INSERT INTO Lineups
    (player_id, match_id, team_id)
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 1, 3),
    (4, 2, 4);