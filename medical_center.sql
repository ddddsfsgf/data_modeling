DROP DATABASE IF EXISTS  medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE Doctors
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    specialty TEXT
);

CREATE TABLE Diseases
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT
);

CREATE TABLE Patients
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    insurance TEXT,
    birthday DATE
);

CREATE TABLE Visits
(
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES Doctors ON DELETE CASCADE,
    patient_id INTEGER REFERENCES Patients ON DELETE CASCADE,
    date DATE
);

CREATE TABLE Diagnostics
(
    id SERIAL PRIMARY KEY,
    visit_id INTEGER REFERENCES Visits ON DELETE CASCADE,
    disease_id INTEGER REFERENCES Diseases ON DELETE CASCADE,
    notes TEXT
);

INSERT INTO Doctors
    (name, specialty)
VALUES
    ('Dr.Hartman', 'Surgery'),
    ('Dr.Petcu', 'Medicine'),
    ('Dr.D', 'Pediatrics');

INSERT INTO Diseases
    (name, description)
VALUES
    ('Flu', 'Infects the nose, throat and sometimes lungs.'),
    ('Mumps', 'Causes puffy cheeks and a swollen jaw.'),
    ('Chicken Pox', 'Itchy rashes and pink spots all over the body.');

INSERT INTO Patients
    (name, insurance, birthday)
VALUES
    ('John Goodman', 'HMO', '1952-06-20'),
    ('Greg James', 'POS', '1982-04-19'),
    ('Drake Bell', 'EMO', '1986-06-27');

INSERT INTO Visits
    (doctor_id, patient_id, date)
VALUES
    (1, 3, '2024-02-27'),
    (2, 1, '2023-11-18'),
    (3, 2, '2024-01-15'),
    (1, 1, '2023-12-08');

INSERT INTO Diagnostics
    (visit_id, disease_id, notes)
VALUES
    (2, 3, 'Do not scratch'),
    (1, 2, 'Drink plenty of fluids'),
    (3, 2, 'Drink plenty of fluids');

